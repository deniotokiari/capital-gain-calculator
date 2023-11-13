package pl.deniotokiari.capitalgaincalculator.data.datasource

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringSetPreferencesKey
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.mapNotNull
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import pl.deniotokiari.capitalgaincalculator.AppDispatchers
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.failed
import pl.deniotokiari.capitalgaincalculator.core.success
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.model.toLocalModel

class CurrencyAlphaVantageDataSource(
    private val okHttpClient: OkHttpClient,
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

class CurrencyLocalDataSource(
    private val dataStore: DataStore<Preferences>
) {
    private suspend fun setCurrencies(
        key: Preferences.Key<Set<String>>,
        currencies: List<Currency>
    ): Result<Unit, DataError> = runCatching {
        dataStore.edit {
            it[key] = currencies.map { currency -> currency.toLocalModel() }.toSet()
        }
    }.fold(
        onSuccess = { Unit.success() },
        onFailure = { DataError(it).failed() }
    )

    private fun currencies(key: Preferences.Key<Set<String>>): Flow<Result<List<Currency>, DataError>> =
        dataStore.data.mapNotNull {
            it[key]?.map { item ->
                Currency.fromLocalModel(item)
            }?.success()
        }

    suspend fun setPhysicalCurrencies(currencies: List<Currency>): Result<Unit, DataError> = setCurrencies(
        KEY_PHYSICAL_CURRENCIES, currencies
    )

    suspend fun setDigitalCurrencies(currencies: List<Currency>): Result<Unit, DataError> = setCurrencies(
        KEY_DIGITAL_CURRENCIES, currencies
    )

    fun physicalCurrencies(): Flow<Result<List<Currency>, DataError>> = currencies(KEY_PHYSICAL_CURRENCIES)

    fun digitalCurrencies(): Flow<Result<List<Currency>, DataError>> = currencies(KEY_DIGITAL_CURRENCIES)

    companion object {
        private val KEY_PHYSICAL_CURRENCIES = stringSetPreferencesKey("physical_currencies")
        private val KEY_DIGITAL_CURRENCIES = stringSetPreferencesKey("digital_currencies")
    }
}