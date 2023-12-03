package pl.deniotokiari.capitalgaincalculator.data.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize
import java.math.BigDecimal

val USD = Currency(
    name = "USD",
    code = Currency.Code("USD"),
    type = Currency.Type.Physical
)

@Parcelize
data class Currency(
    val name: String,
    val code: Code,
    val type: Type
) : Parcelable {
    val title: String get() = "${code.value} - $name"

    @JvmInline
    @Parcelize
    value class Code(val value: String) : Parcelable {
        companion object {
            fun fromLocalModel(value: String): Code = Code(value)
        }
    }

    enum class Type {
        Physical,
        Digital,
        Unknown;

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

        fun fromCode(code: String): Currency = Currency(
            name = code,
            code = Code(code),
            type = Currency.Type.Unknown
        )
    }
}

@Parcelize
data class CurrencyValue(
    val value: BigDecimal,
    val currency: Currency
) : Parcelable

fun Currency.Type.toLocalModel(): String = ordinal.toString()

fun Currency.Code.toLocalModel(): String = value

fun Currency.toLocalModel(): String = "$name:${code.toLocalModel()}:${type.toLocalModel()}"