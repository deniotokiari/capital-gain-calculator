package pl.deniotokiari.capitalgaincalculator.data.datasource

import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.BuildConfig
import pl.deniotokiari.capitalgaincalculator.data.model.ApiToken
import java.util.Stack

interface ApiKeyDataSource {
    fun getAlphaVantageApiKey(): ApiToken

    fun useNextApiKey()

    fun isLastApiKey(): Boolean
}

@Single
class ApiKeyLocalDataSource : ApiKeyDataSource {
    private val keys = Stack<String>()

    init {
        keys.addAll(BuildConfig.ALPHA_VANTAGE_API_KEYS)
    }

    override fun getAlphaVantageApiKey(): ApiToken = keys.peek().let(::ApiToken)

    override fun useNextApiKey() {
        if (keys.size == 1) {
            return
        }

        keys.pop()
    }

    override fun isLastApiKey(): Boolean = keys.size == 1
}