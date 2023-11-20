package pl.deniotokiari.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.Ticker

data class TickerWithMarketData(
    val ticker: Ticker,
    val data: MarketData?
)