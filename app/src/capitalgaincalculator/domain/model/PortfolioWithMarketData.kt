package legacy.capitalgaincalculator.domain.model

data class PortfolioWithMarketData(
    val name: String,
    val data: MarketData?
)