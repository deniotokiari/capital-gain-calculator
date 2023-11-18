package pl.deniotokiari.capitalgaincalculator.domain.model

data class PortfolioWithMarketData(
    val name: String,
    val data: MarketData?
)