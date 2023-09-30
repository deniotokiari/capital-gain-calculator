package pl.deniotokiari.capitalgaincalculator.feature.instrument.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.feature.instrument.InstrumentRepository

class GetInstrumentIdBySymbolIdAndPortfolioIdUseCase(
    private val instrumentRepository: InstrumentRepository
) :
    UseCase<GetInstrumentIdBySymbolIdAndPortfolioIdUseCase.Params, String> {
    override suspend fun invoke(params: Params): String = instrumentRepository.getInstrumentBySymbolIdAndPortfolioId(
        symbolId = params.symbolId,
        portfolioId = params.portfolioId
    ).id

    data class Params(
        val symbolId: String,
        val portfolioId: String
    )
}