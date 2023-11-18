package pl.deniotokiari.capitalgaincalculator.data.service.alphavantage

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model.SymbolSearch
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query

interface AlphaVantageService {
    @GET("/query?function=SYMBOL_SEARCH")
    suspend fun symbolSearch(@Query("keywords") keywords: String): SymbolSearch

    companion object {
        fun create(httpClient: OkHttpClient): AlphaVantageService {
            val retrofit = Retrofit.Builder()
                .client(httpClient)
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