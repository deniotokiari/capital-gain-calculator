package pl.deniotokiari.capitalgaincalculator.core.network

import okhttp3.OkHttpClient
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.data.repository.ApiKeyRepository

private const val API_KEY = "apiKey"

@Named(POLIGON)
@Single
fun createPoligon(
    @Named(ANONYMOUS) client: OkHttpClient,
    apiKeyRepository: ApiKeyRepository
): OkHttpClient = client
    .newBuilder()
    .addInterceptor {
        it.proceed(
            it.request()
                .newBuilder()
                .url(
                    it
                        .request()
                        .url
                        .newBuilder()
                        .addQueryParameter(API_KEY, apiKeyRepository.getPoligonApiKey())
                        .build()
                ).build()
        )
    }
    .build()