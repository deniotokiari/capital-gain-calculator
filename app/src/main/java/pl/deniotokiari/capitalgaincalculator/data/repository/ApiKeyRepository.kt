package pl.deniotokiari.capitalgaincalculator.data.repository

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.data.datasource.ApiKeyDataSource
import pl.deniotokiari.capitalgaincalculator.data.model.ApiToken

@Factory
class ApiKeyRepository(
    private val apiKeyDataSource: ApiKeyDataSource
) {
    fun getAlphaVantageApiKey(): ApiToken = apiKeyDataSource.getAlphaVantageApiKey()
}