package pl.deniotokiari.capitalgaincalculator.data.repository

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.data.datasource.ApiKeyDataSource

@Factory
class ApiKeyRepository(
    private val apiKeyDataSource: ApiKeyDataSource
) {
    fun getAlphaVantageApiKey(): String = apiKeyDataSource.getAlphaVantageApiKey()

    fun getPoligonApiKey(): String = apiKeyDataSource.getPoligonApiKey()

    fun getYahooFinanceApiKey(): String = apiKeyDataSource.getYahooFinanceApiKey()
}