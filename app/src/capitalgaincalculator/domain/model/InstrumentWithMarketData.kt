package legacy.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker

sealed class InstrumentWithMarketData(
    open val instrumentId: String,
    open val data: MarketData?,
    open val positions: List<PositionWithMarketData>
) {
    data class TickerInstrument(
        val ticker: Ticker,
        override val instrumentId: String,
        override val data: MarketData?,
        override val positions: List<PositionWithMarketData>
    ) : InstrumentWithMarketData(instrumentId, data, positions)

    data class CurrencyInstrument(
        val currency: Currency,
        override val instrumentId: String,
        override val data: MarketData?,
        override val positions: List<PositionWithMarketData>
    ) : InstrumentWithMarketData(instrumentId, data, positions)
}