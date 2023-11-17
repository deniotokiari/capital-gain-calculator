package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.repository.PortfolioRepository
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData

@Factory(binds = [GetAllPortfoliosUseCase::class])
class GetAllPortfoliosUseCase(
    private val portfolioRepository: PortfolioRepository
) : FlowUseCase<Unit, List<PortfolioWithMarketData>> {
    override fun invoke(params: Unit): Flow<List<PortfolioWithMarketData>> = portfolioRepository.portfolios().map {
        it.map { item ->
            PortfolioWithMarketData(
                id = item.id,
                name = item.name
            )
        }
    }
}