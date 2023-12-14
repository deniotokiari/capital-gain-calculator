package pl.deniotokiari.data.currency.model

data class Currency(
    val code: String,
    val name: String?,
    val type: Type
) {
    enum class Type {
        Physical,
        Digital
    }
}