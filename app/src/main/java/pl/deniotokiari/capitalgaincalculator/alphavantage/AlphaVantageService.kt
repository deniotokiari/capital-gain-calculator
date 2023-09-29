package pl.deniotokiari.capitalgaincalculator.alphavantage

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import pl.deniotokiari.capitalgaincalculator.alphavantage.model.SymbolSearchResponse
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.create
import retrofit2.http.GET
import retrofit2.http.Query

interface AlphaVantageService {
    @GET("query")
    suspend fun symbolSearch(
        @Query("function") function: String = "SYMBOL_SEARCH",
        @Query("keywords") keywords: String
    ): SymbolSearchResponse

    companion object {
        fun service(
            client: OkHttpClient,
            apikey: String
        ): AlphaVantageService {
            val retrofit = Retrofit
                .Builder()
                .addConverterFactory(
                    MoshiConverterFactory.create(
                        Moshi.Builder()
                            .addLast(KotlinJsonAdapterFactory())
                            .build()
                    )
                )
                .client(
                    client
                        .newBuilder()
                        .addInterceptor {
                            it.proceed(
                                it
                                    .request()
                                    .newBuilder()
                                    .url(
                                        it
                                            .request()
                                            .url
                                            .newBuilder()
                                            .addQueryParameter("apikey", apikey)
                                            .build()
                                    )
                                    .build()
                            )
                        }
                        .build()
                )
                .baseUrl("https://www.alphavantage.co/")
                .build()

            return retrofit.create()
        }
    }
}