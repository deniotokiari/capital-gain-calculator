package pl.deniotokiari.capitalgaincalculator.data.datasource

import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.BuildConfig
import pl.deniotokiari.capitalgaincalculator.data.model.ApiToken
import java.util.Stack

interface ApiKeyDataSource {
    fun getAlphaVantageApiKey(): ApiToken

    fun useNextAlphaVantageApiKey()

    fun isLastAlphaVantageApiKey(): Boolean

    fun getPoligonApiKey(): String

    fun getYahooFinanceApiKey(): String
}

@Single
class ApiKeyLocalDataSource : ApiKeyDataSource {
    private val alphaVantageAPiKeys = Stack<String>()

    init {
        alphaVantageAPiKeys.addAll(BuildConfig.ALPHA_VANTAGE_API_KEYS)
    }

    override fun getAlphaVantageApiKey(): ApiToken = alphaVantageAPiKeys.peek().let(::ApiToken)

    override fun useNextAlphaVantageApiKey() {
        if (alphaVantageAPiKeys.size == 1) {
            return
        }

        alphaVantageAPiKeys.pop()
    }

    override fun isLastAlphaVantageApiKey(): Boolean = alphaVantageAPiKeys.size == 1

    override fun getPoligonApiKey(): String = BuildConfig.POLIGON_API_KEY

    override fun getYahooFinanceApiKey(): String = BuildConfig.YAHOO_FINANCE_API_KEY
}