package pl.deniotokiari.capitalgaincalculator.core.network

import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Response
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.data.repository.ApiKeyRepository

private const val API_KEY = "apikey"
private const val API_RATE_LIMIT = "API rate limit"

@Named(ALPHA_VANTAGE)
@Single
fun create(
    @Named(ANONYMOUS) anonymous: OkHttpClient,
    apiKeyRepository: ApiKeyRepository
): OkHttpClient {
    fun makeRequest(chain: Interceptor.Chain, apiKey: String): Response {
        val url = chain.request().url.newBuilder().addQueryParameter(API_KEY, apiKey).build()

        return chain.proceed(
            chain
                .request()
                .newBuilder()
                .url(url)
                .build()
        )
    }

    fun shouldUseNexApiKey(response: Response): Boolean = response.peekBody(Long.MAX_VALUE).string()
        .contains(API_RATE_LIMIT) && !apiKeyRepository.isLastAlphaVantageApiKey()

    return anonymous
        .newBuilder()
        .addInterceptor {
            var response = makeRequest(it, apiKeyRepository.getAlphaVantageApiKey().value)

            while (shouldUseNexApiKey(response)) {
                apiKeyRepository.useNextAlphaVantageApiKey()

                response = makeRequest(it, apiKeyRepository.getAlphaVantageApiKey().value)
            }

            response
        }
        .build()
}