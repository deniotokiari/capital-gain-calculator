package pl.deniotokiari.capitalgaincalculator.data.repository

import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.data.datasource.ApiKeyDataSource
import pl.deniotokiari.capitalgaincalculator.data.model.ApiToke
import pl.deniotokiari.capitalgaincalculator.data.model.DataError

class ApiKeyRepository(
    private val apiKeyDataSource: ApiKeyDataSource
) {
    suspend fun getAlphaVantageApiKey(): Result<ApiToke, DataError> = apiKeyDataSource.getAlphaVantageApiKey()
}