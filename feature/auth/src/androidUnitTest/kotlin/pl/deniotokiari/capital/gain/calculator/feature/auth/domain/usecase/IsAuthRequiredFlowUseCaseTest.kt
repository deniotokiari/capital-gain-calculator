package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.flow.toCollection
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.feature.auth.data.AuthDataSource


@OptIn(ExperimentalCoroutinesApi::class)
class IsAuthRequiredFlowUseCaseTest {
    private lateinit var mockAuthDataSource: AuthDataSource
    private lateinit var sut: IsAuthRequiredFlowUseCase

    @BeforeEach
    fun setUp() {
        mockAuthDataSource = mock()
        sut = IsAuthRequiredFlowUseCase(mockAuthDataSource)
    }

    @Test
    fun `GIVEN auth data source fire values WHEN sut invoked THEN return flow of values`() =
        runTest {
            whenever(mockAuthDataSource.authenticationRequired()).thenReturn(
                flowOf(
                    false,
                    true,
                    true,
                    false,
                ),
            )
            val result = mutableListOf<Boolean>()

            val job = launch {
                sut(Unit).toCollection(result)
            }

            advanceUntilIdle()

            job.cancel()


            assertEquals(
                listOf(
                    false,
                    true,
                    true,
                    false,
                ),
                result,
            )
        }
}