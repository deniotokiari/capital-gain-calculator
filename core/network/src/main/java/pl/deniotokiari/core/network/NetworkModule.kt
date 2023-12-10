package pl.deniotokiari.core.network

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import org.koin.core.annotation.ComponentScan
import org.koin.core.annotation.Module
import org.koin.core.annotation.Named
import org.koin.core.annotation.Property
import org.koin.core.annotation.Single
import pl.deniotokiari.core.network.alphavantage.AlphaVantageService
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.converter.scalars.ScalarsConverterFactory

const val ALPHA_VANTAGE_SERVICE_ANONYMOUS = "ALPHA_VANTAGE_SERVICE_ANONYMOUS"
const val ALPHA_VANTAGE_SERVICE_AUTHORIZED = "ALPHA_VANTAGE_SERVICE_AUTHORIZED"

@Module
@ComponentScan("pl.deniotokiari.core.network")
class NetworkModule {
    @Single
    fun okHttpClient(): OkHttpClient = OkHttpClient()

    @Single
    fun retrofit(): Retrofit = Retrofit.Builder()
        .addConverterFactory(ScalarsConverterFactory.create())
        .addConverterFactory(
            MoshiConverterFactory.create(
                Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
            )
        )
        .build()

    @Named(ALPHA_VANTAGE_SERVICE_ANONYMOUS)
    @Single
    fun alphaVantageServiceAnonymous(okHttpClient: OkHttpClient, retrofit: Retrofit): AlphaVantageService = retrofit
        .newBuilder()
        .baseUrl("https://www.alphavantage.co")
        .client(okHttpClient.newBuilder().build())
        .build()
        .create(AlphaVantageService::class.java)

    @Named(ALPHA_VANTAGE_SERVICE_AUTHORIZED)
    @Single
    fun alphaVantageServiceAuthorized(
        @Property("alpha_vantage_api_key") apiKey: String,
        okHttpClient: OkHttpClient,
        retrofit: Retrofit
    ): AlphaVantageService = retrofit
        .newBuilder()
        .baseUrl("https://www.alphavantage.co")
        .client(
            okHttpClient
                .newBuilder()
                .addInterceptor {
                    it.proceed(
                        it
                            .request()
                            .newBuilder()
                            .url(it.request().url.newBuilder().addQueryParameter("apikey", apiKey).build())
                            .build()
                    )
                }
                .build()
        )
        .build()
        .create(AlphaVantageService::class.java)
}
