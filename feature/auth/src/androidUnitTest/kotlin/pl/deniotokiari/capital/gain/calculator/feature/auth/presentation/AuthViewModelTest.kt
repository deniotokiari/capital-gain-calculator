package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.toCollection
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.core.test.getAppDispatcher
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.IsAuthRequiredUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.LoginUserWithEmailAndPasswordUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.SignupUserWithEmailAndPasswordUseCase
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import pl.deniotokiari.core.navigation.route.AuthType
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals

class AuthViewModelTest {
    private lateinit var mockIsAuthRequiredUseCase: IsAuthRequiredUseCase
    private lateinit var mockSignupUserWithEmailAndPasswordUseCase: SignupUserWithEmailAndPasswordUseCase
    private lateinit var mockLoginUserWithEmailAndPasswordUseCase: LoginUserWithEmailAndPasswordUseCase

    @BeforeTest
    fun setUp() {
        mockIsAuthRequiredUseCase = mock()
        mockSignupUserWithEmailAndPasswordUseCase = mock()
        mockLoginUserWithEmailAndPasswordUseCase = mock()
    }

    @Test
    fun `GIVEN auth required WHEN sut created THEN state contains ui type`() = runTest {
        whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(true)

        listOf(AuthType.Login, AuthType.Signup).forEach { type ->
            assertEquals(
                type.toUiType,
                createSut(type).uiState.value.type
            )
        }
    }

    @Test
    fun `GIVEN auth not required WHEN sut created THEN state does not contain ui type`() = runTest {
        whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)

        val sut = createSut(AuthType.Login)

        assertEquals(AuthUiType.Loading, sut.uiState.value.type)
    }

    @Test
    fun `WHEN email change action THEN state contains new email`() = runTest {
        whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
        val sut = createSut(AuthType.Login)
        sut.onAction(AuthUiAction.EmailChanged("test@email.com"))

        assertEquals("test@email.com", sut.uiState.value.email.value)
    }

    @Test
    fun `WHEN password change action THEN state contains new password`() = runTest {
        whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
        val sut = createSut(AuthType.Login)
        sut.onAction(AuthUiAction.PasswordChanged("password"))

        assertEquals("password", sut.uiState.value.password.value)
    }

    @Test
    fun `WHEN login action and login success THEN perform login action`() = runTest {
        whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
        whenever(
            mockLoginUserWithEmailAndPasswordUseCase.invoke(
                LoginUserWithEmailAndPasswordUseCase.Params(
                    email = "",
                    password = "",
                ),
            ),
        ).thenReturn(true.ok())
        val sut = createSut(AuthType.Login)
        sut.onAction(AuthUiAction.Login)

        verify(mockLoginUserWithEmailAndPasswordUseCase).invoke(
            LoginUserWithEmailAndPasswordUseCase.Params(
                email = "",
                password = "",
            ),
        )

        assertEquals(
            CredentialsField(
                value = "",
                error = false,
                enabled = false,
            ),
            sut.uiState.value.email,
        )

        assertEquals(
            CredentialsField(
                value = "",
                error = false,
                enabled = false,
            ),
            sut.uiState.value.password,
        )
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    @Test
    fun `WHEN login action and login failed with generic error THEN perform login action and show error`() =
        runTest(UnconfinedTestDispatcher()) {
            whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
            whenever(
                mockLoginUserWithEmailAndPasswordUseCase.invoke(
                    LoginUserWithEmailAndPasswordUseCase.Params(
                        email = "",
                        password = "",
                    ),
                ),
            ).thenReturn(AuthError.GenericError.error())
            val sut = createSut(AuthType.Login)
            val events = mutableListOf<AuthUiEvent>()
            val job = launch {
                sut.event.toCollection(events)
            }
            sut.onAction(AuthUiAction.Login)
            advanceUntilIdle()
            job.cancel()

            verify(mockLoginUserWithEmailAndPasswordUseCase).invoke(
                LoginUserWithEmailAndPasswordUseCase.Params(
                    email = "",
                    password = "",
                ),
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = false,
                    enabled = false,
                ),
                sut.uiState.value.email,
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = false,
                    enabled = false,
                ),
                sut.uiState.value.password,
            )

            assertEquals(
                listOf<AuthUiEvent>(AuthUiEvent.Error),
                events,
            )
        }

    @Test
    fun `WHEN login action and login failed with credentials error THEN perform login action and state contains error`() =
        runTest {
            whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
            whenever(
                mockLoginUserWithEmailAndPasswordUseCase.invoke(
                    LoginUserWithEmailAndPasswordUseCase.Params(
                        email = "",
                        password = "",
                    ),
                ),
            ).thenReturn(AuthError.InvalidCredentials.error())
            val sut = createSut(AuthType.Login)
            sut.onAction(AuthUiAction.Login)

            verify(mockLoginUserWithEmailAndPasswordUseCase).invoke(
                LoginUserWithEmailAndPasswordUseCase.Params(
                    email = "",
                    password = "",
                ),
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = true,
                    enabled = true,
                ),
                sut.uiState.value.email,
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = true,
                    enabled = true,
                ),
                sut.uiState.value.password,
            )
        }

    @Test
    fun `WHEN signup action and login success THEN perform signup action`() = runTest {
        whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
        whenever(
            mockSignupUserWithEmailAndPasswordUseCase.invoke(
                SignupUserWithEmailAndPasswordUseCase.Params(
                    email = "",
                    password = "",
                ),
            ),
        ).thenReturn(true.ok())
        val sut = createSut(AuthType.Login)
        sut.onAction(AuthUiAction.Signup)

        verify(mockSignupUserWithEmailAndPasswordUseCase).invoke(
            SignupUserWithEmailAndPasswordUseCase.Params(
                email = "",
                password = "",
            ),
        )

        assertEquals(
            CredentialsField(
                value = "",
                error = false,
                enabled = false,
            ),
            sut.uiState.value.email,
        )

        assertEquals(
            CredentialsField(
                value = "",
                error = false,
                enabled = false,
            ),
            sut.uiState.value.password,
        )
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    @Test
    fun `WHEN signup action and signup failed with generic error THEN perform signup action and show error`() =
        runTest(UnconfinedTestDispatcher()) {
            whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
            whenever(
                mockSignupUserWithEmailAndPasswordUseCase.invoke(
                    SignupUserWithEmailAndPasswordUseCase.Params(
                        email = "",
                        password = "",
                    ),
                ),
            ).thenReturn(AuthError.GenericError.error())
            val sut = createSut(AuthType.Login)
            val events = mutableListOf<AuthUiEvent>()
            val job = launch {
                sut.event.toCollection(events)
            }
            sut.onAction(AuthUiAction.Signup)
            advanceUntilIdle()
            job.cancel()

            verify(mockSignupUserWithEmailAndPasswordUseCase).invoke(
                SignupUserWithEmailAndPasswordUseCase.Params(
                    email = "",
                    password = "",
                ),
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = false,
                    enabled = false,
                ),
                sut.uiState.value.email,
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = false,
                    enabled = false,
                ),
                sut.uiState.value.password,
            )

            assertEquals(
                listOf<AuthUiEvent>(AuthUiEvent.Error),
                events,
            )
        }

    @Test
    fun `WHEN signup action and signup failed with credentials error THEN perform signup action and state contains error`() =
        runTest {
            whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
            whenever(
                mockSignupUserWithEmailAndPasswordUseCase.invoke(
                    SignupUserWithEmailAndPasswordUseCase.Params(
                        email = "",
                        password = "",
                    ),
                ),
            ).thenReturn(AuthError.InvalidCredentials.error())
            val sut = createSut(AuthType.Login)
            sut.onAction(AuthUiAction.Signup)

            verify(mockSignupUserWithEmailAndPasswordUseCase).invoke(
                SignupUserWithEmailAndPasswordUseCase.Params(
                    email = "",
                    password = "",
                ),
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = true,
                    enabled = true,
                ),
                sut.uiState.value.email,
            )

            assertEquals(
                CredentialsField(
                    value = "",
                    error = true,
                    enabled = true,
                ),
                sut.uiState.value.password,
            )
        }

    @OptIn(ExperimentalCoroutinesApi::class)
    @Test
    fun `WHEN navigate to login THEN fire navigate to login event`() =
        runTest(UnconfinedTestDispatcher()) {
            whenever(mockIsAuthRequiredUseCase.invoke(Unit)).thenReturn(false)
            val sut = createSut(AuthType.Login)
            val events = mutableListOf<AuthUiEvent>()
            val job = launch {
                sut.event.toCollection(events)
            }
            sut.onAction(AuthUiAction.NavigateToLogin)
            advanceUntilIdle()
            job.cancel()

            assertEquals(
                listOf<AuthUiEvent>(AuthUiEvent.NavigateToLogin),
                events,
            )
        }

    private fun TestScope.createSut(type: AuthType) = AuthViewModel(
        isAuthRequiredUseCase = mockIsAuthRequiredUseCase,
        signupUserWithEmailAndPasswordUseCase = mockSignupUserWithEmailAndPasswordUseCase,
        loginUserWithEmailAndPasswordUseCase = mockLoginUserWithEmailAndPasswordUseCase,
        type = type,
        appDispatchers = getAppDispatcher(),
    )
}