package legacy.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbConversionRate
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.DbPosition
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData

@Factory(binds = [GetAllPortfoliosWithMarketDataUseCase::class])
class GetAllPortfoliosWithMarketDataUseCase(
    private val portfolioDao: DbPortfolio.Dao,
    private val getPortfolioMarketDataUseCase: GetPortfolioMarketDataUseCase,
    private val positionDao: DbPosition.Dao,
    private val conversionRateDao: DbConversionRate.Dao
) : FlowUseCase<Unit, List<PortfolioWithMarketData>> {
    override fun invoke(params: Unit): Flow<List<PortfolioWithMarketData>> = positionDao
        .positions().combine(conversionRateDao.rates()) { _, _ -> }
        .combine(portfolioDao.portfolios()) { _, portfolios ->
            portfolios.map { portfolio ->
                PortfolioWithMarketData(
                    name = portfolio.portfolio.name,
                    data = getPortfolioMarketDataUseCase(portfolio.portfolio.name)
                )
            }.sortedBy { it.data?.percent?.value?.let { value -> -value } }
        }
}