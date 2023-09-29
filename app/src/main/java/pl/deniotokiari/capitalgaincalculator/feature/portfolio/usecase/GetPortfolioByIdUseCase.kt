package pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.Portfolio
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioRepository

class GetPortfolioByIdUseCase(
    private val portfolioRepository: PortfolioRepository
) : UseCase<String, Portfolio> {
    override suspend fun invoke(params: String): Portfolio = portfolioRepository.getPortfolioById(params)
}