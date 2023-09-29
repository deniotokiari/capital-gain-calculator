package pl.deniotokiari.capitalgaincalculator.currency

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map

interface CurrencyRepository {
    fun getCurrencyList(): Flow<List<Currency>>

    suspend fun updateCurrencyList()

    suspend fun getCurrencyByCode(code: String): Currency
}

class CurrencyRepositoryImpl(
    private val currencyRemoteDataSource: CurrencyRemoteDataSource,
    private val currencyLocalDataSource: CurrencyLocalDataSource
) : CurrencyRepository {

    private suspend fun getFromRemote(): List<Currency> {
        val physical = currencyRemoteDataSource.getPhysicalCurrency().fold(
            onFailure = { emptyList<Currency>() },
            onSuccess = { it.map { item -> Currency.Fiat(code = item.first, name = item.second) } }
        )
        val crypto = currencyRemoteDataSource.getCryptoCurrency().fold(
            onFailure = { emptyList<Currency>() },
            onSuccess = { it.map { item -> Currency.Crypto(code = item.first, name = item.second) } }
        )

        return mutableListOf<Currency>().apply {
            addAll(physical)
            addAll(crypto)
        }
    }

    override fun getCurrencyList() =
        currencyLocalDataSource.currencyList().map { items -> items.map { it.toCurrency() } }

    override suspend fun updateCurrencyList() {
        val items = getFromRemote()

        if (items.isNotEmpty()) {
            currencyLocalDataSource.removeAll()
            currencyLocalDataSource.saveCurrencyList(items)
        }
    }

    override suspend fun getCurrencyByCode(code: String): Currency = currencyLocalDataSource.getCurrencyByCode(code)
}