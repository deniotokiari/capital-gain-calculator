package pl.deniotokiari.capitalgaincalculator.data.datasource

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.BuildConfig
import pl.deniotokiari.capitalgaincalculator.data.model.ApiToken

interface ApiKeyDataSource {
    fun getAlphaVantageApiKey(): ApiToken
}

@Factory
class ApiKeyLocalDataSource : ApiKeyDataSource {
    override fun getAlphaVantageApiKey(): ApiToken = ApiToken(BuildConfig.ALPHA_VANTAGE_API_KEY)
}