package pl.deniotokiari.data.currency.repository

import android.util.Log
import org.koin.core.annotation.Single
import pl.deniotokiari.data.currency.datasource.CurrencyAlphaVantageDataSource
import pl.deniotokiari.data.currency.datasource.CurrencyRoomDataSource
import pl.deniotokiari.data.currency.model.Currency
import pl.deniotokiari.data.currency.model.DbCurrency
import pl.deniotokiari.data.currency.model.toCurrenciesList

private const val LOG_TAG = "CurrencyRepository"

@Single
class CurrencyRepository(
    private val alphaVantageDataSource: CurrencyAlphaVantageDataSource,
    private val roomDataSource: CurrencyRoomDataSource
) {
    suspend fun updateCurrencies() {
        runCatching {
            fun mapper(code: String, name: String, type: DbCurrency.Type) = DbCurrency(
                code = code,
                name = name,
                type = type
            )

            val physical = alphaVantageDataSource.getPhysicalCurrencies()
            val digital = alphaVantageDataSource.getDigitalCurrencies()

            (physical.map { (code, name) -> mapper(code, name, DbCurrency.Type.Physical) }
                    +
                    digital.map { (code, name) -> mapper(code, name, DbCurrency.Type.Digital) }).let { items ->
                roomDataSource.addCurrencies(items)
            }
        }.fold(
            onSuccess = { Log.d(LOG_TAG, "refreshCurrencies success") },
            onFailure = { Log.e(LOG_TAG, "refreshCurrencies failed", it) }
        )
    }

    suspend fun getCurrencies(): List<Currency> = roomDataSource.getCurrencies().toCurrenciesList()
}