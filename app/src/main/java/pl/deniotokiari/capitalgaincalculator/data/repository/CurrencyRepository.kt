package pl.deniotokiari.capitalgaincalculator.data.repository

import kotlinx.coroutines.flow.Flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.flatMapFailed
import pl.deniotokiari.capitalgaincalculator.core.flatMapSuccess
import pl.deniotokiari.capitalgaincalculator.core.fold
import pl.deniotokiari.capitalgaincalculator.core.mapSuccess
import pl.deniotokiari.capitalgaincalculator.core.onSuccess
import pl.deniotokiari.capitalgaincalculator.core.success
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyAlphaVantageDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyPoligonDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyRoomDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyYahooDataSource
import pl.deniotokiari.capitalgaincalculator.data.db.DbConversionRate
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import java.math.BigDecimal

@Factory
class CurrencyRepository(
    private val currencyAlphaVantageDataSource: CurrencyAlphaVantageDataSource,
    private val currencyPoligonDataSource: CurrencyPoligonDataSource,
    private val currencyYahooDataSource: CurrencyYahooDataSource,
    private val currencyRoomDataSource: CurrencyRoomDataSource,
    private val conversionRateDao: DbConversionRate.Dao
) {
    fun getByCode(code: String): Currency = currencyRoomDataSource.currencyByCode(code)

    fun currencies(): Flow<List<Currency>> = currencyRoomDataSource.currencies()

    suspend fun update(): Result<Unit, DataError> = currencyAlphaVantageDataSource.getPhysicalCurrencies()
        .flatMapSuccess { physicalCurrencies ->
            currencyAlphaVantageDataSource.getDigitalCurrencies()
                .mapSuccess { digitalCurrencies -> physicalCurrencies to digitalCurrencies }
        }
        .flatMapSuccess { (physicalCurrencies, digitalCurrencies) ->
            currencyRoomDataSource.setCurrencies(physicalCurrencies + digitalCurrencies)

            Unit.success()
        }

    suspend fun conversionRate(from: Currency, to: Currency): BigDecimal =
        conversionRateDao.rate(from = from.code.value, to = to.code.value)
            ?: currencyAlphaVantageDataSource
                .conversionRate(from, to)
                .flatMapFailed { currencyYahooDataSource.conversionRate(from = from, to = to) }
                .flatMapFailed { currencyPoligonDataSource.conversionRate(from = from, to = to) }
                .onSuccess { conversionRateDao.addRate(from = from.code.value, to = to.code.value, rate = it) }
                .fold(
                    success = { it },
                    failed = { BigDecimal.ONE }
                )

}