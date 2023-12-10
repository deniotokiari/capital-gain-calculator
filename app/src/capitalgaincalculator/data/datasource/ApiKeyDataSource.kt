package legacy.capitalgaincalculator.data.datasource

import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.BuildConfig
import kotlin.random.Random

interface ApiKeyDataSource {
    fun getAlphaVantageApiKey(): String

    fun getPoligonApiKey(): String

    fun getYahooFinanceApiKey(): String
}

@Single
class ApiKeyLocalDataSource : ApiKeyDataSource {
    override fun getAlphaVantageApiKey(): String = BuildConfig.ALPHA_VANTAGE_API_KEY

    override fun getPoligonApiKey(): String = BuildConfig.POLIGON_API_KEY

    override fun getYahooFinanceApiKey(): String =
        BuildConfig.YAHOO_FINANCE_API_KEYS[Random.nextInt(BuildConfig.YAHOO_FINANCE_API_KEYS.size)]
}