package pl.deniotokiari.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import java.math.BigDecimal

data class MarketData(
    val marketValue: CurrencyValue,
    val gain: CurrencyValue,
    val isCash: Boolean = false,
    val percent: Percent = Percent.fromMarketAndGainValues(market = marketValue.value, gain = gain.value)
) {
    companion object {
        fun cash(value: CurrencyValue): MarketData = MarketData(
            marketValue = value,
            gain = value,
            isCash = true,
            percent = Percent(value = BigDecimal.ZERO)
        )

        fun from(
            spent: BigDecimal,
            count: BigDecimal,
            currentPrice: BigDecimal,
            currency: Currency
        ): MarketData =
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

        fun fromMarketAndGainValues(market: BigDecimal, gain: BigDecimal): Percent {
            return if (market == BigDecimal.ZERO || market == gain) {
                Percent(BigDecimal.ZERO)
            } else {
                Percent(BigDecimal((market.toDouble() / (market - gain).toDouble()) * oneHundred - oneHundred))
            }
        }
    }
}