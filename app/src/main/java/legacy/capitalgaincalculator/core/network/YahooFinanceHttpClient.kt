package legacy.capitalgaincalculator.core.network

import okhttp3.OkHttpClient
import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.data.repository.ApiKeyRepository

private const val API_KEY = "x-api-key"

@Named(YAHOO_FINANCE)
@Single
fun createYahooFinanceHttpClient(
    @Named(ANONYMOUS) okHttpClient: OkHttpClient,
    apiKeyRepository: ApiKeyRepository
): OkHttpClient = okHttpClient
    .newBuilder()
    .addInterceptor {
        it.proceed(
            it
                .request()
                .newBuilder()
                .addHeader(API_KEY, apiKeyRepository.getYahooFinanceApiKey())
                .build()
        )
    }
    .build()