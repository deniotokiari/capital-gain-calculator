package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.mockito.Mockito.mock
import org.mockito.kotlin.any
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource

class SignupUserWithEmailAndPasswordUseCaseTest {
    private lateinit var mockAuthDataSource: AuthDataSource
    private lateinit var sut: SignupUserWithEmailAndPasswordUseCase

    @BeforeEach
    fun setUp() {
        mockAuthDataSource = mock()
        sut = SignupUserWithEmailAndPasswordUseCase(mockAuthDataSource)
    }

    @Test
    fun `GIVEN success login WHEN sut invoked THEN return true`() = runTest {
        whenever(mockAuthDataSource.signup(any(), any())).thenReturn(Result.success(true))

        val result = sut(
            SignupUserWithEmailAndPasswordUseCase.Params(
                email = "email",
                password = "password",
            ),
        ).getOrNull()


        assertNotNull(result)
        assertTrue(result!!)
    }

    @Test
    fun `GIVEN failed login WHEN sut invoked THEN return invalid credentials error`() = runTest {
        whenever(mockAuthDataSource.signup(any(), any())).thenReturn(Result.success(false))

        val result = sut(
            SignupUserWithEmailAndPasswordUseCase.Params(
                email = "email",
                password = "password",
            ),
        ).errorOrNull()


        assertNotNull(result)
        assertEquals(AuthError.InvalidCredentials, result)
    }

    @Test
    fun `GIVEN login throws exception WHEN sut invoked THEN return generic error`() = runTest {
        whenever(mockAuthDataSource.signup(any(), any())).thenReturn(Result.failure(Exception()))

        val result = sut(
            SignupUserWithEmailAndPasswordUseCase.Params(
                email = "email",
                password = "password",
            ),
        ).errorOrNull()

        assertNotNull(result)
        assertEquals(AuthError.GenericError, result)
    }
}