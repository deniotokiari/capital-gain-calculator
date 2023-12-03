package pl.deniotokiari.capitalgaincalculator.data.datasource

import kotlinx.coroutines.test.runTest
import org.junit.Test
import java.io.File

class CryptoTest {
    @Test
    fun setUp() {

    }

    @Test
    fun `d`() = runTest {
        val file = javaClass.classLoader?.getResource("account_statement.csv")?.let { File(it.path) }
        val map = mutableMapOf<String, MutableList<List<String>>>()

        file?.forEachLine {
            val items = it.split(",")
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

        map.forEach { (t, u) ->
            println("$t => $u")
        }
    }

    private fun getCrypto(items: List<String>): String = items[6]

    private fun getDate(items: List<String>): String = items[3].split(" ")[0].split("-").joinToString(",")

    private fun getQuantity(items: List<String>): String = items[5]

    private fun getTotalAmount(items: List<String>): String = items[8]

    private fun getCurrency(items: List<String>): String = items[10]

    private fun getType(items: List<String>): String = items[0]

    private fun isExchange(type: String): Boolean = type == "EXCHANGE"

    private fun isReward(type: String): Boolean = type == "REWARD"
}