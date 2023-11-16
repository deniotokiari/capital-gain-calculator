package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData

@Factory(binds = [GetAllPortfoliosUseCase::class])
class GetAllPortfoliosUseCase() : FlowUseCase<Unit, List<PortfolioWithMarketData>> {
    override fun invoke(params: Unit): Flow<List<PortfolioWithMarketData>> = flow { emit(emptyList()) }
}