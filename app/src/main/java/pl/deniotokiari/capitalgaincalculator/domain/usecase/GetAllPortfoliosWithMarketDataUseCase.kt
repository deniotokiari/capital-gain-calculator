package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData

@Factory(binds = [GetAllPortfoliosWithMarketDataUseCase::class])
class GetAllPortfoliosWithMarketDataUseCase(
    private val portfolioDao: DbPortfolio.Dao,
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList
) : FlowUseCase<Unit, List<PortfolioWithMarketData>> {
    override fun invoke(params: Unit): Flow<List<PortfolioWithMarketData>> =
        portfolioDao.portfoliosWithPositions().map {
            it.map { (portfolio, positions) ->
                PortfolioWithMarketData(
                    name = portfolio.portfolio.name,
                    data = positions.map { position ->
                        // TODO convert currency
                        MarketData.from(
                            spent = position.position.price,
                            count = position.position.count,
                            currentPrice = position.ticker.ticker.price,
                            currency = portfolio.currency.toDataModel()
                        )
                    }.let { items -> calculateMarketDataFromMarketDataList(items) }
                )
            }
        }
}