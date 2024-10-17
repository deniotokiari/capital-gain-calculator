package pl.deniotokiari.capital.gain.calculator.feature.currency.data

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.core.misc.HttpClient
import pl.deniotokiari.core.misc.Store

interface CurrenciesDataSource {
    suspend fun getPhysicalCurrencies(): List<Currency>
}

private const val PHYSICAL_CURRENCIES_ENDPOINT =
    "https://www.alphavantage.co/physical_currency_list"
internal const val PHYSICAL_CURRENCIES_KEY = "PHYSICAL_CURRENCIES_KEY"

class AlphaVantageCurrenciesRemoteDataSource(
    private val httpClient: HttpClient,
) : CurrenciesDataSource {
    override suspend fun getPhysicalCurrencies(): List<Currency> = httpClient
        .get<String>(PHYSICAL_CURRENCIES_ENDPOINT)
        .split("\n")
        .drop(1)
        .dropLast(1)
        .map { line ->
            Currency.Physical(
                code = line.substringBefore(","),
                name = line.substringAfter(","),
            )
        }
}

class CurrenciesLocalDataSource(
    private val store: Store,
) : CurrenciesDataSource {
    override suspend fun getPhysicalCurrencies(): List<Currency> = store
        .getString(PHYSICAL_CURRENCIES_KEY)
        ?.let {
            Json.decodeFromString(it)
        }
        ?: emptyList()

    fun savePhysicalCurrencies(currencies: List<Currency>) {
        store.putString(PHYSICAL_CURRENCIES_KEY, Json.encodeToString(currencies))
    }
}