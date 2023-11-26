package pl.deniotokiari.capitalgaincalculator.domain.usecase

import android.content.Context
import android.net.Uri
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase

@Factory(binds = [ImportTrading212TickersUseCase::class])
class ImportTrading212TickersUseCase(
    private val context: Context
) : UseCase<Uri, Map<String, List<List<String>>>> {
    private fun isBuy(value: String?): Boolean = value?.lowercase()?.contains("buy") ?: false

    private fun isSell(value: String?): Boolean = value?.lowercase()?.contains("sell") ?: false

    private fun getType(values: List<String>): String? = values.getOrNull(0)

    private fun getDate(values: List<String>): String? = values
        .getOrNull(1)
        ?.split(" ")
        ?.get(0)
        ?.split("-")
        ?.joinToString(",")

    private fun getQuantity(values: List<String>): String? = values.getOrNull(5)

    private fun getTicker(values: List<String>): String? = values.getOrNull(3)

    private fun getTotalAmount(values: List<String>): String? = values.getOrNull(11)

    private fun getCurrency(values: List<String>): String? = values.getOrNull(12)

    override suspend fun invoke(params: Uri): Map<String, List<List<String>>> {
        val map = mutableMapOf<String, MutableList<List<String>>>()
        val sold = mutableSetOf<String>()

        context.contentResolver.openInputStream(params)?.use { stream ->
            stream.bufferedReader().use { reader ->
                reader.forEachLine { line ->
                    val values = line.split(",")

                    if (!sold.contains(getTicker(values))) {
                        val type = getType(values)

                        if (isBuy(type)) {
                            val ticker = getTicker(values)
                            val date = getDate(values)
                            val quantity = getQuantity(values)
                            val totalAmount = getTotalAmount(values)
                            val currency = getCurrency(values)

                            if (date != null && ticker != null && quantity != null && totalAmount != null && currency != null) {
                                val list = map[ticker] ?: mutableListOf()

                                list.add(listOf(date, quantity, totalAmount, currency))

                                map[ticker] = list
                            }
                        } else if (isSell(type)) {
                            val ticker = getTicker(values)

                            if (ticker != null) {
                                sold.add(ticker)

                                map.remove(ticker)
                            }
                        }
                    }
                }
            }
        }

        return map
    }
}