package pl.deniotokiari.capitalgaincalculator.core.network

import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Response
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.data.repository.ApiKeyRepository

private const val API_KEY = "apikey"

@Named(ALPHA_VANTAGE)
@Single
fun createAlphaVantage(
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

    return anonymous
        .newBuilder()
        .addInterceptor { makeRequest(it, apiKeyRepository.getAlphaVantageApiKey().value) }
        .build()
}