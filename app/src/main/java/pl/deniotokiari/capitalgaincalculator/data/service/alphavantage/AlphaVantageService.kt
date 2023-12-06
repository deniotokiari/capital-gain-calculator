package pl.deniotokiari.capitalgaincalculator.data.service.alphavantage

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.core.network.ALPHA_VANTAGE
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model.CurrencyExchangeRate
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model.Quote
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model.SymbolSearch
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query

interface AlphaVantageService {
    @GET("/query?function=SYMBOL_SEARCH")
    suspend fun symbolSearch(@Query("keywords") keywords: String): SymbolSearch

    @GET("/query?function=GLOBAL_QUOTE")
    suspend fun quote(@Query("symbol") symbol: String): Quote

    @GET("/query?function=CURRENCY_EXCHANGE_RATE")
    suspend fun currencyExchangeRate(
        @Query("from_currency") from: String,
        @Query("to_currency") to: String
    ): CurrencyExchangeRate
}

@Single
fun createAlphaVantageService(@Named(ALPHA_VANTAGE) http: OkHttpClient): AlphaVantageService {
    val retrofit = Retrofit.Builder()
        .client(http)
        .baseUrl("https://www.alphavantage.co")
        .addConverterFactory(
            MoshiConverterFactory.create(
                Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
            )
        )
        .build()

    return retrofit.create(AlphaVantageService::class.java)
}