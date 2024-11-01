package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.mockito.Mockito.mock
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.feature.auth.data.AuthDataSource

class IsAuthRequiredUseCaseTest {
    private lateinit var mockAuthDataSource: AuthDataSource
    private lateinit var sut: IsAuthRequiredUseCase

    @BeforeEach
    fun setUp() {
        mockAuthDataSource = mock()
        sut = IsAuthRequiredUseCase(mockAuthDataSource)
    }

    @Test
    fun `GIVEN auth required WHEN sut invoked THEN return true`() = runTest {
        whenever(mockAuthDataSource.authenticationRequired()).thenReturn(flowOf(true))

        val result = sut(Unit)

        assertTrue(result)
    }

    @Test
    fun `GIVEN auth not required WHEN sut invoked THEN return false`() = runTest {
        whenever(mockAuthDataSource.authenticationRequired()).thenReturn(flowOf(false))

        val result = sut(Unit)

        assertFalse(result)
    }
}