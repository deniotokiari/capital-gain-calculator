package pl.deniotokiari.capital.gain.calculator.feature.currency.data

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok

interface CurrenciesRepository {
    suspend fun getPhysicalCurrencies(force: Boolean): Result<List<Currency>, Exception>
}

class CurrenciesRepositoryImpl(
    private val remoteCurrenciesDataSource: AlphaVantageCurrenciesRemoteDataSource,
    private val localCurrenciesDataSource: CurrenciesLocalDataSource,
) : CurrenciesRepository {
    override suspend fun getPhysicalCurrencies(force: Boolean): Result<List<Currency>, Exception> =
        if (force) {
            runCatching {
                remoteCurrenciesDataSource.getPhysicalCurrencies()
                    .also(localCurrenciesDataSource::savePhysicalCurrencies)
            }.fold(
                onSuccess = { it.ok() },
                onFailure = { Exception(it).error() }
            )
        } else {
            val localCurrencies = localCurrenciesDataSource.getPhysicalCurrencies()

            if (localCurrencies.isEmpty()) {
                getPhysicalCurrencies(force = true)
            } else {
                localCurrencies.ok()
            }
        }
}
