package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation

import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.runTest
import org.mockito.Mockito.mock
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.core.test.getAppDispatcher
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.IsAuthRequiredUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.LoginUserWithEmailAndPasswordUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.SignupUserWithEmailAndPasswordUseCase
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

    private fun TestScope.createSut(type: AuthType) = AuthViewModel(
        isAuthRequiredUseCase = mockIsAuthRequiredUseCase,
        signupUserWithEmailAndPasswordUseCase = mockSignupUserWithEmailAndPasswordUseCase,
        loginUserWithEmailAndPasswordUseCase = mockLoginUserWithEmailAndPasswordUseCase,
        type = type,
        appDispatchers = getAppDispatcher(),
    )
}