package pl.deniotokiari.capitalgaincalculator.data.service.yahoo

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.core.network.YAHOO_FINANCE
import pl.deniotokiari.capitalgaincalculator.data.service.yahoo.model.Autocomplete
import pl.deniotokiari.capitalgaincalculator.data.service.yahoo.model.Quote
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query

interface YahooFinanceService {
    @GET("/v6/finance/autocomplete")
    suspend fun autocomplete(
        @Query("query") query: String,
        @Query("lang") lang: String = "en"
    ): Autocomplete

    @GET("/v6/finance/quote")
    suspend fun quote(
        @Query("symbols") symbols: String,
        @Query("lang") lang: String = "en"
    ): Quote
}

@Single
fun createYahooFinanceService(
    @Named(YAHOO_FINANCE) httpClient: OkHttpClient
): YahooFinanceService {
    val retrofit = Retrofit.Builder()
        .client(httpClient)
        .baseUrl("https://yfapi.net")
        .addConverterFactory(
            MoshiConverterFactory.create(
                Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
            )
        )
        .build()

    return retrofit.create(YahooFinanceService::class.java)
}