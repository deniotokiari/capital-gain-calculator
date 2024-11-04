package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.mockito.Mockito.mock
import org.mockito.kotlin.any
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.feature.auth.data.AuthDataSource
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import kotlin.test.assertNotNull

class LoginUserWithEmailAndPasswordUseCaseTest {
    private lateinit var mockAuthDataSource: AuthDataSource
    private lateinit var sut: LoginUserWithEmailAndPasswordUseCase

    @BeforeEach
    fun setUp() {
        mockAuthDataSource = mock()
        sut = LoginUserWithEmailAndPasswordUseCase(mockAuthDataSource)
    }

    @Test
    fun `GIVEN login success WHEN sut invoked THEN return true`() = runTest {
        whenever(mockAuthDataSource.login(any(), any())).thenReturn(true.ok())

        val result = sut(
            LoginUserWithEmailAndPasswordUseCase.Params(
                email = "email",
                password = "password",
            ),
        ).getOrNull()

        assertNotNull(result)
    }

    @Test
    fun `GIVEN login failed WHEN sut invoked THEN return error`() = runTest {
        whenever(mockAuthDataSource.login(any(), any())).thenReturn(Exception().error())

        val result = sut(
            LoginUserWithEmailAndPasswordUseCase.Params(
                email = "email",
                password = "password",
            ),
        ).errorOrNull()

        assertEquals(AuthError.GenericError, result)
    }
}