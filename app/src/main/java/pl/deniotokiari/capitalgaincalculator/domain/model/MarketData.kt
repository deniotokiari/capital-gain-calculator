package pl.deniotokiari.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import java.math.BigDecimal

data class MarketData(
    val marketValue: CurrencyValue,
    val gain: CurrencyValue,
    val percent: Percent = Percent.fromMarketAndGainValues(market = marketValue.value, gain = gain.value)
) {
    companion object {
        fun from(spent: BigDecimal, count: BigDecimal, currentPrice: BigDecimal, currency: Currency): MarketData =
            MarketData(
                marketValue = CurrencyValue(value = count * currentPrice, currency = currency),
                gain = CurrencyValue(value = count * currentPrice - spent, currency = currency)
            )
    }
}

@JvmInline
value class Percent(val value: BigDecimal) {
    companion object {
        private const val oneHundred = 100.0

        // ((market + gain) / market) * 100 - 100
        fun fromMarketAndGainValues(market: BigDecimal, gain: BigDecimal): Percent {
            return if (market == BigDecimal.ZERO) {
                Percent(BigDecimal.ZERO)
            } else {
                Percent(BigDecimal(((market + gain).toDouble() / market.toDouble()) * oneHundred - oneHundred))
            }
        }
    }
}