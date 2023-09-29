package pl.deniotokiari.capitalgaincalculator.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioRepository

class DeletePortfolioUseCase(
    private val portfolioRepository: PortfolioRepository
): UseCase<String, Unit> {
    override suspend fun invoke(params: String) = portfolioRepository.deletePortfolio(params)
}