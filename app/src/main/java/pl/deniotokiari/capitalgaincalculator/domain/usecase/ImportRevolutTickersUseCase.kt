package pl.deniotokiari.capitalgaincalculator.domain.usecase

import android.content.Context
import android.net.Uri
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase

@Factory(binds = [ImportRevolutTickersUseCase::class])
class ImportRevolutTickersUseCase(
    private val context: Context
) : UseCase<Uri, Map<String, List<List<String>>>> {
    private fun isBuy(value: String?): Boolean = value?.lowercase()?.contains("buy") ?: false

    private fun getType(values: List<String>): String? = values.getOrNull(2)

    private fun getDate(values: List<String>): String? = values.getOrNull(0)

    private fun getQuantity(values: List<String>): String? = values.getOrNull(3)

    private fun getTicker(values: List<String>): String? = values.getOrNull(1)

    private fun getTotalAmount(values: List<String>): String? = values.getOrNull(5)?.drop(1)

    private fun getCurrency(values: List<String>): String? = values.getOrNull(6)

    override suspend fun invoke(params: Uri): Map<String, List<List<String>>> {
        val map = mutableMapOf<String, MutableList<List<String>>>()

        context.contentResolver.openInputStream(params)?.use { stream ->
            stream.bufferedReader().use { reader ->
                reader.forEachLine { line ->
                    val values = line.split(",")
                    val type = getType(values)

                    if (isBuy(type)) {
                        val date = getDate(values)
                        val ticker = getTicker(values)
                        val quantity = getQuantity(values)
                        val totalAmount = getTotalAmount(values)
                        val currency = getCurrency(values)

                        if (date != null && ticker != null && quantity != null && totalAmount != null && currency != null) {
                            val list = map[ticker] ?: mutableListOf()

                            list.add(listOf(date, quantity, totalAmount, currency))

                            map[ticker] = list
                        }
                    }
                }
            }
        }

        return map
    }
}