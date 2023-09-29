package pl.deniotokiari.capitalgaincalculator.usecase

import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.core.BlockingUseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.Portfolio
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioRepository

class GetPortfoliosBlockingUseCase(
    private val portfolioRepository: PortfolioRepository
) : BlockingUseCase<Unit, Flow<List<Portfolio>>> {
    override fun invoke(params: Unit): Flow<List<Portfolio>> = portfolioRepository.getPortfolios()
}