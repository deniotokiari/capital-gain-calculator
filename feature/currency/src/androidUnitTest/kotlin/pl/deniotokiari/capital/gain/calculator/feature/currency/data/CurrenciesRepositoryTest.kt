package pl.deniotokiari.capital.gain.calculator.feature.currency.data

import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.kotlin.whenever
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import kotlin.test.assertEquals

class CurrenciesRepositoryTest {
    private lateinit var mockRemoteCurrenciesDataSource: AlphaVantageCurrenciesRemoteDataSource
    private lateinit var mockLocalCurrenciesDataSource: CurrenciesLocalDataSource
    private lateinit var sut: CurrenciesRepository

    @BeforeEach
    fun setUp() {
        mockRemoteCurrenciesDataSource = mock()
        mockLocalCurrenciesDataSource = mock()
        sut = CurrenciesRepository(
            remoteCurrenciesDataSource = mockRemoteCurrenciesDataSource,
            localCurrenciesDataSource = mockLocalCurrenciesDataSource,
        )
    }

    @Test
    fun `GIVEN force is true and remote source success WHEN getPhysicalCurrencies THEN remote data source is called and result is cached`() =
        runTest {
            val currencies = listOf(Currency.Physical("USD", "US Dollar"))
            whenever(mockRemoteCurrenciesDataSource.getPhysicalCurrencies()).thenReturn(currencies)
            whenever(mockLocalCurrenciesDataSource.getPhysicalCurrencies()).thenReturn(emptyList())

            val result = sut.getPhysicalCurrencies(force = true)

            assertEquals(currencies, result.getOrNull())
            verify(mockLocalCurrenciesDataSource).savePhysicalCurrencies(currencies)
        }

    @Test
    fun `GIVEN force is true and remote source failed WHEN getPhysicalCurrencies THEN return error`() =
        runTest {
            val error = RuntimeException()
            whenever(mockRemoteCurrenciesDataSource.getPhysicalCurrencies()).thenThrow(error)

            val result = sut.getPhysicalCurrencies(force = true)

            assertEquals(error, result.exceptionOrNull())
        }

    @Test
    fun `GIVEN force is true and remote source success and local source failed WHEN getPhysicalCurrencies THEN return error`() =
        runTest {
            val currencies = listOf(Currency.Physical("USD", "US Dollar"))
            val error = RuntimeException()
            whenever(mockRemoteCurrenciesDataSource.getPhysicalCurrencies()).thenReturn(currencies)
            whenever(mockLocalCurrenciesDataSource.savePhysicalCurrencies(currencies)).thenThrow(
                error
            )

            val result = sut.getPhysicalCurrencies(force = true)

            assertEquals(error, result.exceptionOrNull())
        }

    @Test
    fun `GIVEN force is false and local source success WHEN getPhysicalCurrencies THEN local data source is called and result is returned`() =
        runTest {
            val currencies = listOf(Currency.Physical("USD", "US Dollar"))
            whenever(mockLocalCurrenciesDataSource.getPhysicalCurrencies()).thenReturn(currencies)

            val result = sut.getPhysicalCurrencies(force = false)

            assertEquals(currencies, result.getOrNull())
            verify(mockLocalCurrenciesDataSource).getPhysicalCurrencies()
        }

    @Test
    fun `GIVEN force is false and local source returns empty list WHEN getPhysicalCurrencies THEN remote data source is called and result is cached`() =
        runTest {
            val currencies = listOf(Currency.Physical("USD", "US Dollar"))
            whenever(mockRemoteCurrenciesDataSource.getPhysicalCurrencies()).thenReturn(currencies)
            whenever(mockLocalCurrenciesDataSource.getPhysicalCurrencies()).thenReturn(emptyList())

            val result = sut.getPhysicalCurrencies(force = false)

            assertEquals(currencies, result.getOrNull())
            verify(mockRemoteCurrenciesDataSource).getPhysicalCurrencies()
            verify(mockLocalCurrenciesDataSource).savePhysicalCurrencies(currencies)
        }

    @Test
    fun `GIVEN force is false and local source failed WHEN getPhysicalCurrencies THEN return error`() =
        runTest {
            val error = RuntimeException()
            whenever(mockLocalCurrenciesDataSource.getPhysicalCurrencies()).thenThrow(error)

            val result = sut.getPhysicalCurrencies(force = false)

            assertEquals(error, result.exceptionOrNull())
        }
}