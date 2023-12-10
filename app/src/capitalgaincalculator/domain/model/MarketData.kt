package legacy.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import java.math.BigDecimal

private val oneHundred = BigDecimal(100)

data class MarketData(
    val value: BigDecimal,
    val gain: BigDecimal?,
    val currency: Currency
) {
    @JvmInline
    value class Percent(val value: BigDecimal) {
        companion object {
            fun get(value: BigDecimal, gain: BigDecimal?): Percent {
                return if (value == BigDecimal.ZERO || value == gain || gain == null) {
                    Percent(BigDecimal.ZERO)
                } else {
                    Percent(BigDecimal((value.toDouble() / (value - gain).toDouble())) * oneHundred - oneHundred)
                }
            }
        }
    }

    operator fun plus(other: MarketData): MarketData {
        return copy(
            value = value + other.value,
            gain = when {
                gain == null && other.gain == null -> null
                gain != null && other.gain == null -> gain
                gain == null && other.gain != null -> other.gain
                else -> null // Should not happen
            }
        )
    }
}

val MarketData.percent: MarketData.Percent get() = MarketData.Percent.get(value, gain)

val MarketData.valueWithCurrency: CurrencyValue get() = CurrencyValue(value = value, currency = currency)

val MarketData.gainWithCurrency: CurrencyValue? get() = gain?.let { CurrencyValue(value = it, currency = currency) }
