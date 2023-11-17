package pl.deniotokiari.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import java.math.BigDecimal

data class MarketData(
    val marketValue: CurrencyValue,
    val gain: CurrencyValue,
    val percent: Percent
)

@JvmInline
value class Percent(val value: BigDecimal)