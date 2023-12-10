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

fun DbCurrency.Type.toCurrencyType(): Currency.Type = enumValues<Currency.Type>()[ordinal]

fun List<DbCurrency>.toCurrenciesList(): List<Currency> = map { (code, name, type) ->
    Currency(
        code = code,
        name = name,
        type = type.toCurrencyType()
    )
}