@file:OptIn(ExperimentalCoroutinesApi::class)

package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.core.successOrNull
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.DbPosition
import pl.deniotokiari.capitalgaincalculator.data.repository.ProfileRepository
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData

@Factory(binds = [GetProfileMarketDataUseCase::class])
class GetProfileMarketDataUseCase(
    private val getPortfolioMarketDataUseCase: GetPortfolioMarketDataUseCase,
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList,
    private val profileRepository: ProfileRepository,
    private val portfolioDao: DbPortfolio.Dao,
    private val positionDao: DbPosition.Dao
) : FlowUseCase<Unit, MarketData?> {
    override fun invoke(params: Unit): Flow<MarketData?> = positionDao
        .positions().combine(profileRepository.profileCurrency()) { _, currency ->
            requireNotNull(currency.successOrNull())
        }
        .combine(portfolioDao.portfolios()) { currency, portfolios ->
            portfolios
                .mapNotNull { portfolio -> getPortfolioMarketDataUseCase(portfolio.portfolio.name) }
                .let {
                    calculateMarketDataFromMarketDataList(
                        CalculateMarketDataFromMarketDataList.Params(
                            targetCurrency = currency,
                            data = it
                        )
                    )
                }
        }
}