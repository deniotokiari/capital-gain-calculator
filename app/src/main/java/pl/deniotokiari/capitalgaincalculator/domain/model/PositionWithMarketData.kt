package pl.deniotokiari.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.Position

class PositionWithMarketData(
    val position: Position,
    val marketData: MarketData?
)