package pl.deniotokiari.capitalgaincalculator.currency

import kotlinx.coroutines.flow.Flow

class CurrencyLocalDataSource(
    private val currencyDao: CurrencyDao
) {
    fun currencyList(): Flow<List<DbCurrency>> =
        currencyDao.getAll()

    suspend fun saveCurrencyList(list: List<Currency>) {
        currencyDao.insertAll(list.map { it.toDbCurrency() })
    }

    suspend fun removeAll() {
        currencyDao.removeAll()
    }

    suspend fun getCurrencyByCode(code: String): Currency = currencyDao.getByCode(code).toCurrency()
}