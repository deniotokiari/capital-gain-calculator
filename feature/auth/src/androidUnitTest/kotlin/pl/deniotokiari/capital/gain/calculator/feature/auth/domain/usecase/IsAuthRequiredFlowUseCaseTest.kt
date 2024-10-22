package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class IsAuthRequiredFlowUseCaseTest {
    private lateinit var mockAuthDataSource: AuthDataSource
    private lateinit var sut: IsAuthRequiredFlowUseCase

    @BeforeTest
    fun setUp(){
        mockAuthDataSource = mock()
        sut = IsAuthRequiredFlowUseCase(mockAuthDataSource)
    }

    @Test
    fun `GIVEN auth not required WHEN sut invoked THEN return false`() = runTest {
        whenever(mockAuthDataSource.authenticationRequired()).thenReturn(flowOf(false))

        val result = sut(Unit).first()

        assertFalse(result)
    }

    @Test
    fun `GIVEN auth required WHEN sut invoked THEN return true`() = runTest {
        whenever(mockAuthDataSource.authenticationRequired()).thenReturn(flowOf(true))

        val result = sut(Unit).first()

        assertTrue(result)
    }
}