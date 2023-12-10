package legacy.capitalgaincalculator.data.repository

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import legacy.capitalgaincalculator.data.datasource.CurrencyAlphaVantageDataSource
import legacy.capitalgaincalculator.data.datasource.CurrencyPoligonDataSource
import legacy.capitalgaincalculator.data.datasource.CurrencyRoomDataSource
import legacy.capitalgaincalculator.data.datasource.CurrencyYahooDataSource
import legacy.capitalgaincalculator.data.db.DbConversionRate
import org.koin.core.annotation.Single
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

@Single
class CurrencyRepository(
    private val currencyAlphaVantageDataSource: CurrencyAlphaVantageDataSource,
    private val currencyPoligonDataSource: CurrencyPoligonDataSource,
    private val currencyYahooDataSource: CurrencyYahooDataSource,
    private val currencyRoomDataSource: CurrencyRoomDataSource,
    private val conversionRateDao: DbConversionRate.Dao
) {
    private val mutex = Mutex()
    private val cache = mutableMapOf<String, BigDecimal>()

    suspend fun getByCode(code: String): Currency = currencyRoomDataSource.currencyByCode(code)

    fun currencies(): Flow<List<Currency>> = currencyRoomDataSource.currencies()

    suspend fun updateCurrencies(): Result<Unit, DataError> = currencyAlphaVantageDataSource.getPhysicalCurrencies()
        .flatMapSuccess { physicalCurrencies ->
            currencyAlphaVantageDataSource.getDigitalCurrencies()
                .mapSuccess { digitalCurrencies -> physicalCurrencies to digitalCurrencies }
        }
        .flatMapSuccess { (physicalCurrencies, digitalCurrencies) ->
            currencyRoomDataSource.setCurrencies(physicalCurrencies + digitalCurrencies)

            Unit.success()
        }

    suspend fun updateConversionRates(): Result<Unit, DataError> {
        val rates = conversionRateDao.allRates()

        rates.forEach { (fromCode, toCode, _) ->
            val from = getByCode(fromCode)
            val to = getByCode(toCode)

            currencyAlphaVantageDataSource
                .conversionRate(from = from, to = to)
                .flatMapFailed { currencyYahooDataSource.conversionRate(from = from, to = to) }
                .flatMapFailed { currencyPoligonDataSource.conversionRate(from = from, to = to) }
                .onSuccess {
                    conversionRateDao.addRate(
                        DbConversionRate.Model(
                            fromCode = from.code.value,
                            toCode = to.code.value,
                            rate = it
                        )
                    )
                }
        }

        return Unit.success()
    }

    suspend fun conversionRate(from: Currency, to: Currency): BigDecimal = mutex.withLock {
        val memValue = cache["${from.code.value}${to.code.value}"]

        if (memValue != null) {
            return memValue
        }

        val dbValue = conversionRateDao.rate(from = from.code.value, to = to.code.value)

        if (dbValue != null) {
            return dbValue
        }

        val remoteValue = currencyAlphaVantageDataSource
            .conversionRate(from = from, to = to)
            .flatMapFailed { currencyYahooDataSource.conversionRate(from = from, to = to) }
            .flatMapFailed { currencyPoligonDataSource.conversionRate(from = from, to = to) }
            .fold(
                success = { it },
                failed = { BigDecimal.ONE }
            )
        val remoteValueVersa = BigDecimal(1.0 / remoteValue.toDouble())

        cache["${from.code.value}${to.code.value}"] = remoteValue
        cache["${to.code.value}${from.code.value}"] = remoteValueVersa

        conversionRateDao.addRate(
            DbConversionRate.Model(
                fromCode = from.code.value,
                toCode = to.code.value,
                rate = remoteValue
            )
        )

        conversionRateDao.addRate(
            DbConversionRate.Model(
                fromCode = to.code.value,
                toCode = from.code.value,
                rate = remoteValueVersa
            )
        )

        return remoteValue
    }
}