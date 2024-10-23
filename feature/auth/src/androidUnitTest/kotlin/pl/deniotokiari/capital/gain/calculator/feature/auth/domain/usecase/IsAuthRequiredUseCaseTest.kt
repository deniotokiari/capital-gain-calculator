package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.mockito.Mockito.mock
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class IsAuthRequiredUseCaseTest {
    private lateinit var mockAuthDataSource: AuthDataSource
    private lateinit var sut: IsAuthRequiredUseCase

    @BeforeTest
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