package pl.deniotokiari.capitalgaincalculator.data.repository

import kotlinx.coroutines.flow.Flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.flatMap
import pl.deniotokiari.capitalgaincalculator.core.mapSuccess
import pl.deniotokiari.capitalgaincalculator.core.success
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyAlphaVantageDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyRoomDataSource
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError

@Factory
class CurrencyRepository(
    private val currencyAlphaVantageDataSource: CurrencyAlphaVantageDataSource,
    private val currencyRoomDataSource: CurrencyRoomDataSource
) {
    fun currencies(): Flow<List<Currency>> = currencyRoomDataSource.currencies()

    suspend fun update(): Result<Unit, DataError> = currencyAlphaVantageDataSource.getPhysicalCurrencies()
        .flatMap { physicalCurrencies ->
            currencyAlphaVantageDataSource.getDigitalCurrencies()
                .mapSuccess { digitalCurrencies -> physicalCurrencies to digitalCurrencies }
        }
        .flatMap { (physicalCurrencies, digitalCurrencies) ->
            currencyRoomDataSource.setCurrencies(physicalCurrencies + digitalCurrencies)

            Unit.success()
        }
}