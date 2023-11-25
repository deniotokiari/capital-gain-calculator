package pl.deniotokiari.capitalgaincalculator.data.datasource

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.capitalgaincalculator.AppDispatchers
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.failed
import pl.deniotokiari.capitalgaincalculator.core.network.ANONYMOUS
import pl.deniotokiari.capitalgaincalculator.core.success
import pl.deniotokiari.capitalgaincalculator.core.successOrNull
import pl.deniotokiari.capitalgaincalculator.data.db.DbCurrency
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.data.db.toDbCurrency
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.model.USD
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.AlphaVantageService
import pl.deniotokiari.capitalgaincalculator.data.service.poligon.PoligonService
import pl.deniotokiari.capitalgaincalculator.data.service.yahoo.YahooFinanceService
import java.math.BigDecimal

interface CurrencyConversionDataSource {
    suspend fun conversionRate(from: Currency, to: Currency): Result<BigDecimal, DataError>
}

@Factory(binds = [CurrencyPoligonDataSource::class])
class CurrencyPoligonDataSource(
    private val poligonService: PoligonService
) : CurrencyConversionDataSource {
    override suspend fun conversionRate(from: Currency, to: Currency): Result<BigDecimal, DataError> = runCatching {
        when {
            from.type == Currency.Type.Physical && to.type == Currency.Type.Physical ->
                poligonService
                    .previousClose("C:${from.code.value}${to.code.value}")
                    .results[0]
                    .close
                    .toBigDecimal()

            from.type == Currency.Type.Physical && to.type == Currency.Type.Digital -> {
                if (from.code.value == "USD" || from.code.value == "EUR") {
                    poligonService
                        .previousClose("X:${to.code.value}${from.code.value}")
                        .results[0]
                        .close
                        .let { 1 / it }
                        .toBigDecimal()
                } else {
                    val fromAsUsd = conversionRate(from = from, to = USD).successOrNull() ?: throw Exception("No value")

                    poligonService
                        .previousClose("X:${to.code.value}USD")
                        .results[0]
                        .close
                        .let { fromAsUsd.toDouble() / it }
                        .toBigDecimal()
                }
            }

            from.type == Currency.Type.Digital && to.type == Currency.Type.Physical -> {
                if (to.code.value == "USD" || to.code.value == "EUR") {
                    poligonService
                        .previousClose("X:${from.code.value}-${to.code.value}")
                        .results[0]
                        .close
                        .toBigDecimal()
                } else {
                    val toAsUsd = conversionRate(from = to, to = USD).successOrNull() ?: throw Exception("No value")

                    poligonService
                        .previousClose("X${from.code.value}USD")
                        .results[0]
                        .close
                        .let { it / toAsUsd.toDouble() }
                        .toBigDecimal()
                }
            }

            from.type == Currency.Type.Digital && to.type == Currency.Type.Digital -> {
                val fromAsUsd = conversionRate(from = from, to = USD).successOrNull() ?: throw Exception("No value")
                val toAsUsd = conversionRate(from = to, to = USD).successOrNull() ?: throw Exception("No value")

                (fromAsUsd.toDouble() / toAsUsd.toDouble()).toBigDecimal()
            }

            else -> throw Exception("Not implemented")
        }
    }.fold(
        onSuccess = { it.success() },
        onFailure = { DataError(it).failed() }
    )
}

@Factory(binds = [CurrencyYahooDataSource::class])
class CurrencyYahooDataSource(
    private val yahooFinanceService: YahooFinanceService
) : CurrencyConversionDataSource {
    override suspend fun conversionRate(from: Currency, to: Currency): Result<BigDecimal, DataError> = runCatching {
        when {
            from.type == Currency.Type.Physical && to.type == Currency.Type.Physical ->
                yahooFinanceService
                    .quote("${from.code.value}${to.code.value}=X")
                    .quoteResponse
                    .result[0]
                    .regularMarketPrice
                    .toBigDecimal()

            from.type == Currency.Type.Physical && to.type == Currency.Type.Digital -> {
                if (from.code.value == "USD" || from.code.value == "EUR") {
                    yahooFinanceService
                        .quote("${to.code.value}-${from.code.value}")
                        .quoteResponse
                        .result[0]
                        .regularMarketPrice
                        .let { 1 / it }
                        .toBigDecimal()
                } else {
                    yahooFinanceService
                        .quote("${from.code.value}USD=X,${to.code.value}-USD")
                        .quoteResponse
                        .result
                        .let { (a, b) ->
                            a.regularMarketPrice / b.regularMarketPrice
                        }.toBigDecimal()
                }
            }

            from.type == Currency.Type.Digital && to.type == Currency.Type.Physical -> {
                if (to.code.value == "USD" || to.code.value == "EUR") {
                    yahooFinanceService
                        .quote("${from.code.value}-${to.code.value}")
                        .quoteResponse
                        .result[0]
                        .regularMarketPrice
                        .toBigDecimal()
                } else {
                    yahooFinanceService
                        .quote("${from.code.value}-USD,${to.code.value}USD=X")
                        .quoteResponse
                        .result
                        .let { (a, b) ->
                            a.regularMarketPrice / b.regularMarketPrice
                        }.toBigDecimal()
                }
            }

            from.type == Currency.Type.Digital && to.type == Currency.Type.Digital -> {
                yahooFinanceService.quote("${from.code.value}-USD,${to.code.value}-USD")
                    .quoteResponse
                    .result
                    .let { (a, b) ->
                        a.regularMarketPrice / b.regularMarketPrice
                    }
                    .toBigDecimal()
            }

            else -> throw Exception("Not implemented")
        }
    }.fold(
        onSuccess = { it.success() },
        onFailure = { DataError(it).failed() }
    )
}

@Factory(binds = [CurrencyAlphaVantageDataSource::class])
class CurrencyAlphaVantageDataSource(
    @Named(ANONYMOUS) private val okHttpClient: OkHttpClient,
    private val appDispatchers: AppDispatchers,
    private val alphaVantageService: AlphaVantageService
) : CurrencyConversionDataSource {
    private suspend fun getCurrencies(url: String, type: Currency.Type): Result<List<Currency>, DataError> =
        runCatching {
            withContext(appDispatchers.io) {
                val request = Request.Builder().url(url).get().build()
                val response =
                    okHttpClient.newCall(request).execute().body?.string() ?: throw Exception("No response for $url")

                response.split("\n").drop(1).dropLast(1).map { line ->
                    line.split(",").let { (code, name) ->
                        Currency(
                            name = name.trim(),
                            code = Currency.Code(code.trim()),
                            type = type
                        )
                    }
                }
            }
        }.fold(
            onSuccess = { it.success() },
            onFailure = { DataError(it).failed() }
        )

    suspend fun getPhysicalCurrencies(): Result<List<Currency>, DataError> =
        getCurrencies(PHYSICAL_CURRENCIES_URL, Currency.Type.Physical)

    suspend fun getDigitalCurrencies(): Result<List<Currency>, DataError> =
        getCurrencies(DIGITAL_CURRENCIES_URL, Currency.Type.Digital)

    override suspend fun conversionRate(from: Currency, to: Currency): Result<BigDecimal, DataError> = runCatching {
        alphaVantageService.currencyExchangeRate(
            from = from.code.value,
            to = to.code.value
        ).rate.exchangeRate.toBigDecimal()
    }.fold(
        onSuccess = { it.success() },
        onFailure = { DataError(it).failed() }
    )

    companion object {
        private const val PHYSICAL_CURRENCIES_URL = "https://www.alphavantage.co/physical_currency_list"
        private const val DIGITAL_CURRENCIES_URL = "https://www.alphavantage.co/digital_currency_list"
    }
}

@Factory
class CurrencyRoomDataSource(
    private val dao: DbCurrency.Dao,
    private val appDispatchers: AppDispatchers
) {
    suspend fun setCurrencies(
        currencies: List<Currency>
    ) = withContext(appDispatchers.io) {
        dao.addCurrencies(currencies.map { item -> item.toDbCurrency() })
    }

    fun currencies(): Flow<List<Currency>> = dao.currencies().map {
        it.map { item -> item.toDataModel() }
    }.flowOn(appDispatchers.io)

    suspend fun currencyByCode(code: String): Currency = dao.currencyByCode(code).toDataModel()
}