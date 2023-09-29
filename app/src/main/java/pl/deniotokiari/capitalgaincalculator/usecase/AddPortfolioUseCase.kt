package pl.deniotokiari.capitalgaincalculator.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.Portfolio
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioRepository

class AddPortfolioUseCase(
    private val addPortfolioRepository: PortfolioRepository
): UseCase<Portfolio, Unit> {
    override suspend fun invoke(params: Portfolio) = addPortfolioRepository.addPortfolio(params)
}