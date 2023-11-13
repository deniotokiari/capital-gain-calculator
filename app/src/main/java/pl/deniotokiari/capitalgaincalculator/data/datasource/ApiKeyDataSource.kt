package pl.deniotokiari.capitalgaincalculator.data.datasource

import pl.deniotokiari.capitalgaincalculator.BuildConfig
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.Success
import pl.deniotokiari.capitalgaincalculator.data.model.ApiToke
import pl.deniotokiari.capitalgaincalculator.data.model.DataError

interface ApiKeyDataSource {
    suspend fun getAlphaVantageApiKey(): Result<ApiToke, DataError>
}

class ApiKeyLocalDataSource : ApiKeyDataSource {
    override suspend fun getAlphaVantageApiKey(): Result<ApiToke, DataError> =
        Success(ApiToke(BuildConfig.ALPHA_VANTAGE_API_KEY))
}