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
import pl.deniotokiari.capitalgaincalculator.data.db.DbCurrency
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.data.db.toDbCurrency
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError

@Factory
class CurrencyAlphaVantageDataSource(
    @Named(ANONYMOUS) private val okHttpClient: OkHttpClient,
    private val appDispatchers: AppDispatchers
) {
    private suspend fun getCurrencies(url: String, type: Currency.Type): Result<List<Currency>, DataError> =
        runCatching {
            withContext(appDispatchers.io) {
                val request = Request.Builder().url(url).get().build()
                val response =
                    okHttpClient.newCall(request).execute().body?.string() ?: throw Exception("No response for $url")

                response.split("\n").drop(1).dropLast(1).map { line ->
                    line.split(",").let { (code, name) ->
                        Currency(
                            name = name,
                            code = Currency.Code(code),
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

    fun currencyByCode(code: String): Currency = dao.currencyByCode(code).toDataModel()
}