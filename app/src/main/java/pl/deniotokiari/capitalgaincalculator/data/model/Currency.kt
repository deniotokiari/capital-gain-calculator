package pl.deniotokiari.capitalgaincalculator.data.model

import java.math.BigDecimal

data class Currency(
    val name: String,
    val code: Code,
    val type: Type
) {
    val title: String = "${code.value} - $name"

    @JvmInline
    value class Code(val value: String) {
        companion object {
            fun fromLocalModel(value: String): Code = Code(value)
        }
    }

    enum class Type {
        Physical,
        Digital;

        companion object {
            fun fromLocalModel(value: String): Type = value.toInt().let { Type.values()[it] }
        }
    }

    companion object {
        fun fromLocalModel(value: String): Currency = value.split(":").let { (currency, code, type) ->
            Currency(
                name = currency,
                code = Code.fromLocalModel(code),
                type = Type.fromLocalModel(type)
            )
        }
    }
}

data class CurrencyValue(
    val value: BigDecimal,
    val currency: Currency
)

fun Currency.Type.toLocalModel(): String = ordinal.toString()

fun Currency.Code.toLocalModel(): String = value

fun Currency.toLocalModel(): String = "$name:${code.toLocalModel()}:${type.toLocalModel()}"