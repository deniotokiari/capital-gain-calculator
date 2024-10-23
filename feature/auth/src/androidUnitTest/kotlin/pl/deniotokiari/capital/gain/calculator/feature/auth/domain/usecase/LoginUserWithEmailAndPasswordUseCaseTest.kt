package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.test.runTest
import org.mockito.Mockito.mock
import org.mockito.kotlin.any
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class LoginUserWithEmailAndPasswordUseCaseTest {
    private lateinit var mockAuthDataSource: AuthDataSource
    private lateinit var sut: LoginUserWithEmailAndPasswordUseCase

    @BeforeTest
    fun setUp() {
        mockAuthDataSource = mock()
        sut = LoginUserWithEmailAndPasswordUseCase(mockAuthDataSource)
    }

    @Test
    fun `GIVEN login success WHEN sut invoked THEN return true`() = runTest {
        whenever(mockAuthDataSource.login(any(), any())).thenReturn(Result.success(true))

        val result = sut(
            LoginUserWithEmailAndPasswordUseCase.Params(
                email = "email",
                password = "password",
            ),
        ).getOrNull()

        assertNotNull(result)
        assertTrue(result)
    }

    @Test
    fun `GIVEN login failed WHEN sut invoked THEN return error`() = runTest {
        whenever(mockAuthDataSource.login(any(), any())).thenReturn(Result.failure(Exception()))

        val result = sut(
            LoginUserWithEmailAndPasswordUseCase.Params(
                email = "email",
                password = "password",
            ),
        ).errorOrNull()

        assertNotNull(result)
        assertEquals(AuthError.GenericError, result)
    }
}