package pl.deniotokiari.capitalgaincalculator.data.model

data class Ticker(
    val symbol: String,
    val name: String,
    val region: String,
    val currency: Currency
) {
    data class Search(
        val symbol: String,
        val name: String,
        val region: String,
        val currency: String
    )
}