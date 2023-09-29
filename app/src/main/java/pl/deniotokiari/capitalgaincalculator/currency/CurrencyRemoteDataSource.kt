package pl.deniotokiari.capitalgaincalculator.currency

import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request

private const val PHYSICAL_CURRENCY_URL = "https://www.alphavantage.co/physical_currency_list"
private const val CRYPTO_CURRENCY_URL = "https://www.alphavantage.co/digital_currency_list"

class CurrencyRemoteDataSource(
    private val client: OkHttpClient,
    private val ioDispatcher: CoroutineDispatcher
) {

    private suspend fun getCurrency(url: String): Result<List<Pair<String, String>>> = runCatching {
        withContext(ioDispatcher) {
            val request = Request.Builder().url(url).get().build()
            val response = client.newCall(request).execute().body?.string()
                ?: return@withContext listOf<Pair<String, String>>()

            response.split("\n").drop(1).mapNotNull { row ->
                try {
                    row.split(",")
                } catch (_: Exception) {
                    null
                }
            }.mapNotNull {
                try {
                    it[0] to it[1]
                } catch (_: Exception) {
                    null
                }
            }
        }
    }

    suspend fun getPhysicalCurrency(): Result<List<Pair<String, String>>> = getCurrency(
        PHYSICAL_CURRENCY_URL
    )

    suspend fun getCryptoCurrency(): Result<List<Pair<String, String>>> = getCurrency(
        CRYPTO_CURRENCY_URL
    )
}