package pl.deniotokiari.capital.gain.calculator.feature.currency.data

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency

class CurrenciesRepository(
    private val remoteCurrenciesDataSource: AlphaVantageCurrenciesRemoteDataSource,
    private val localCurrenciesDataSource: CurrenciesLocalDataSource,
) {
    suspend fun getPhysicalCurrencies(force: Boolean): Result<List<Currency>> =
        runCatching {
            val localCurrencies = localCurrenciesDataSource.getPhysicalCurrencies()

            if (localCurrencies.isNotEmpty() && !force) {
                localCurrencies
            } else {
                remoteCurrenciesDataSource.getPhysicalCurrencies().also {
                    localCurrenciesDataSource.savePhysicalCurrencies(it)
                }
            }
        }
}