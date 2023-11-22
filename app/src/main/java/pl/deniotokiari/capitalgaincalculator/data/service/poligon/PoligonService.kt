package pl.deniotokiari.capitalgaincalculator.data.service.poligon

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.core.network.POLIGON
import pl.deniotokiari.capitalgaincalculator.data.service.poligon.model.PoligonResponse
import pl.deniotokiari.capitalgaincalculator.data.service.poligon.model.PreviousClose
import pl.deniotokiari.capitalgaincalculator.data.service.poligon.model.Ticker
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface PoligonService {
    @GET("/v3/reference/tickers")
    suspend fun tickers(
        @Query("search") search: String
    ): PoligonResponse<List<Ticker>>

    @GET("/v2/aggs/ticker/{stocksTicker}/prev")
    suspend fun previousClose(@Path("stocksTicker") ticker: String): PoligonResponse<List<PreviousClose>>
}

@Single
fun createPoligonService(
    @Named(POLIGON) httpClient: OkHttpClient
): PoligonService {
    val retrofit = Retrofit.Builder()
        .client(httpClient)
        .baseUrl("https://api.polygon.io")
        .addConverterFactory(
            MoshiConverterFactory.create(
                Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
            )
        )
        .build()

    return retrofit.create(PoligonService::class.java)
}