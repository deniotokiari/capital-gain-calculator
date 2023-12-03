package pl.deniotokiari.capitalgaincalculator.domain.usecase

import android.content.Context
import android.net.Uri
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase

@Factory(binds = [ImportRevolutCurrencyUseCase::class])
class ImportRevolutCurrencyUseCase(
    private val context: Context
) : UseCase<Uri, Map<String, List<List<String>>>> {
    private fun getCrypto(items: List<String>): String = items[6]

    private fun getDate(items: List<String>): String = items[3].split(" ")[0].split("-").joinToString(",")

    private fun getQuantity(items: List<String>): String = items[5]

    private fun getTotalAmount(items: List<String>): String = items[8]

    private fun getCurrency(items: List<String>): String = items[10]

    private fun getType(items: List<String>): String = items[0]

    private fun isExchange(type: String): Boolean = type == "EXCHANGE"

    private fun isReward(type: String): Boolean = type == "REWARD"

    override suspend fun invoke(params: Uri): Map<String, List<List<String>>> {
        val map = mutableMapOf<String, MutableList<List<String>>>()

        context.contentResolver.openInputStream(params)?.use { stream ->
            stream.bufferedReader().use { reader ->
                reader.forEachLine { line ->
                    val items = line.split(",")
                    val type = getType(items)

                    if (isExchange(type) || isReward(type)) {
                        val crypto = getCrypto(items)
                        val date = getDate(items)
                        val quantity = getQuantity(items)
                        val totalAmount = if (isReward(type)) {
                            "0"
                        } else {
                            getTotalAmount(items)
                        }
                        val currency = if (totalAmount == "0") {
                            crypto
                        } else {
                            getCurrency(items)
                        }

                        val list = map[crypto] ?: mutableListOf()

                        list.add(listOf(date, quantity, totalAmount, currency))

                        map[crypto] = list
                    }
                }
            }
        }

        return map
    }
}