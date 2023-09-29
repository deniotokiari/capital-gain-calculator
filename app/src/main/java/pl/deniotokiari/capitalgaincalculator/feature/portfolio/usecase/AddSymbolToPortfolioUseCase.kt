package pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.Portfolio
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioRepository
import pl.deniotokiari.capitalgaincalculator.feature.symbol.Symbol

class AddSymbolToPortfolioUseCase(
    private val portfolioRepository: PortfolioRepository
): UseCase<AddSymbolToPortfolioUseCase.Params, Unit> {
    override suspend fun invoke(params: Params) {
        portfolioRepository.addSymbolToPortfolio(
            symbol = params.symbol,
            portfolio = params.portfolio
        )
    }

    data class Params(
        val symbol: Symbol,
        val portfolio: Portfolio
    )
}