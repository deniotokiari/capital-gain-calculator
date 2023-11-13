package pl.deniotokiari.capitalgaincalculator.data.repository

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.flatMap
import pl.deniotokiari.capitalgaincalculator.core.mapSuccess
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyAlphaVantageDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyLocalDataSource
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError

class CurrencyRepository(
    private val currencyAlphaVantageDataSource: CurrencyAlphaVantageDataSource,
    private val currencyLocalDataSource: CurrencyLocalDataSource
) {
    fun currencies(): Flow<Result<List<Currency>, DataError>> = currencyLocalDataSource.physicalCurrencies()
        .combine(currencyLocalDataSource.digitalCurrencies()) { physicalCurrenciesResult, digitalCurrenciesResult ->
            physicalCurrenciesResult
                .flatMap { physicalCurrencies ->
                    digitalCurrenciesResult
                        .mapSuccess { digitalCurrencies ->
                            physicalCurrencies + digitalCurrencies
                        }
                }
        }

    suspend fun update(): Result<Unit, DataError> = currencyAlphaVantageDataSource.getPhysicalCurrencies()
        .flatMap { physicalCurrencies ->
            currencyAlphaVantageDataSource.getDigitalCurrencies()
                .mapSuccess { digitalCurrencies -> physicalCurrencies to digitalCurrencies }
        }
        .flatMap { (physicalCurrencies, digitalCurrencies) ->
            currencyLocalDataSource.setPhysicalCurrencies(physicalCurrencies)
                .flatMap { currencyLocalDataSource.setDigitalCurrencies(digitalCurrencies) }
        }
}