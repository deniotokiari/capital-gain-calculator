package legacy.capitalgaincalculator.domain.model

import pl.deniotokiari.capitalgaincalculator.data.model.Position

class PositionWithMarketData(
    val position: Position,
    val data: MarketData?
)