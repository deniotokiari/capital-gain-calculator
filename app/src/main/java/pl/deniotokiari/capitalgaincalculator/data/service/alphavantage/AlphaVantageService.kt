package pl.deniotokiari.capitalgaincalculator.data.service.alphavantage

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import okhttp3.Response
import pl.deniotokiari.capitalgaincalculator.data.repository.ApiKeyRepository
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model.SymbolSearch
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query

interface AlphaVantageService {
    @GET("/query?function=SYMBOL_SEARCH")
    suspend fun symbolSearch(@Query("keywords") keywords: String): SymbolSearch

    companion object {
        fun create(httpClient: OkHttpClient, apiKeyRepository: ApiKeyRepository): AlphaVantageService {
            val retrofit = Retrofit.Builder()
                .client(httpClient.newBuilder()
                    .addInterceptor {
                        fun makeRequest(apiKey: String): Response {
                            val url = it.request().url.newBuilder().addQueryParameter("apikey", apiKey).build()

                            return it.proceed(
                                it
                                    .request()
                                    .newBuilder()
                                    .url(url)
                                    .build()
                            )
                        }

                        var response = makeRequest(apiKeyRepository.getAlphaVantageApiKey().value)

                        while (response.body?.string()
                                ?.contains("API rate limit") == true && !apiKeyRepository.isLastAlphaVantageApiKey()
                        ) {
                            apiKeyRepository.useNextAlphaVantageApiKey()

                            response = makeRequest(apiKeyRepository.getAlphaVantageApiKey().value)
                        }

                        response
                    }
                    .build())
                .baseUrl("https://www.alphavantage.co")
                .addConverterFactory(
                    MoshiConverterFactory.create(
                        Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
                    )
                )
                .build()

            return retrofit.create(AlphaVantageService::class.java)
        }
    }
}