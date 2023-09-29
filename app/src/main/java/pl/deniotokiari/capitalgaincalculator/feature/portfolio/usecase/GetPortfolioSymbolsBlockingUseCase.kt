package pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase

import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.core.BlockingUseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioRepository
import pl.deniotokiari.capitalgaincalculator.feature.symbol.Symbol

class GetPortfolioSymbolsBlockingUseCase(
    private val portfolioRepository: PortfolioRepository
) : BlockingUseCase<String, Flow<List<Symbol>>> {
    override fun invoke(params: String): Flow<List<Symbol>> = portfolioRepository.getPortfolioSymbols(params)
}