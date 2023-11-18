package pl.deniotokiari.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import java.math.BigDecimal

data class MarketData(
    val marketValue: CurrencyValue,
    val gain: CurrencyValue,
    val percent: Percent = Percent.fromMarketAndGainValues(market = marketValue.value, gain = gain.value)
)

@JvmInline
value class Percent(val value: BigDecimal) {
    companion object {
        private val oneHundred = BigDecimal(100)

        // ((market + gain) / market) * 100 - 100
        fun fromMarketAndGainValues(market: BigDecimal, gain: BigDecimal): Percent {
            return if (market == BigDecimal.ZERO) {
                Percent(BigDecimal.ZERO)
            } else {
                Percent(((market + gain) / market) * oneHundred - oneHundred)
            }
        }
    }
}