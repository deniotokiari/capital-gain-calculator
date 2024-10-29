package pl.deniotokiari.capital.gain.calculator.feature.currency.data

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency

class CurrenciesRepository(
    private val remoteCurrenciesDataSource: AlphaVantageCurrenciesRemoteDataSource,
    private val localCurrenciesDataSource: CurrenciesLocalDataSource,
) {
    suspend fun getPhysicalCurrencies(force: Boolean): Result<List<Currency>> =
        runCatching {
            if (force) {
                remoteCurrenciesDataSource.getPhysicalCurrencies()
                    .also(localCurrenciesDataSource::savePhysicalCurrencies)
            } else {
                val localCurrencies = localCurrenciesDataSource.getPhysicalCurrencies()

                localCurrencies.ifEmpty {
                    getPhysicalCurrencies(force = true).getOrThrow()
                }
            }
        }
}