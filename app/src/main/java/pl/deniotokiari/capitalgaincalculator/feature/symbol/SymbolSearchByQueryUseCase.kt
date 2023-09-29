package pl.deniotokiari.capitalgaincalculator.feature.symbol

import pl.deniotokiari.capitalgaincalculator.core.UseCase

class SymbolSearchByQueryUseCase(
    private val symbolRepository: SymbolRepository
) : UseCase<String, List<Symbol>> {
    override suspend fun invoke(params: String): List<Symbol> = symbolRepository.searchSymbol(params)
}