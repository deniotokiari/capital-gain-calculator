package pl.deniotokiari.data.currency.datasource

import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.core.network.ALPHA_VANTAGE_SERVICE_ANONYMOUS
import pl.deniotokiari.core.network.ALPHA_VANTAGE_SERVICE_AUTHORIZED
import pl.deniotokiari.core.network.alphavantage.AlphaVantageService

@Factory(binds = [CurrencyAlphaVantageDataSource::class])
class CurrencyAlphaVantageDataSource(
    @Named(ALPHA_VANTAGE_SERVICE_ANONYMOUS) private val alphaVantageServiceAnonymous: AlphaVantageService,
    @Named(ALPHA_VANTAGE_SERVICE_AUTHORIZED) private val alphaVantageServiceAuthorized: AlphaVantageService
) {
    private suspend fun getCurrencies(call: suspend () -> String): List<List<String>> =
        call().split("\n").drop(1).dropLast(1).map { line ->
            line.split(",").let { (code, name) -> listOf(code, name) }
        }

    suspend fun getPhysicalCurrencies(): List<List<String>> =
        getCurrencies(alphaVantageServiceAnonymous::physicalCurrencyList)

    suspend fun getDigitalCurrencies(): List<List<String>> =
        getCurrencies(alphaVantageServiceAnonymous::digitalCurrencyList)
}