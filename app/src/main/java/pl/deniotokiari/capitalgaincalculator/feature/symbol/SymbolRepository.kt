package pl.deniotokiari.capitalgaincalculator.feature.symbol

import pl.deniotokiari.capitalgaincalculator.usecase.GetCurrencyByCodeUseCase

class SymbolRepository(
    private val symbolLocalDataSource: SymbolLocalDataSource,
    private val symbolRemoteDataSource: SymbolRemoteDataSource,
    private val getCurrencyByCodeUseCase: GetCurrencyByCodeUseCase
) {
    suspend fun searchSymbol(query: String): List<Symbol> {
        return runCatching {
            symbolRemoteDataSource.search(query).bestMatches.map {
                Symbol(
                    name = it.name,
                    symbol = it.symbol,
                    region = it.region,
                    type = it.type,
                    currency = getCurrencyByCodeUseCase(it.currency)
                )
            }
        }.fold(
            onSuccess = { it },
            onFailure = {
                emptyList()
            }
        )
    }

    suspend fun addSymbol(symbol: Symbol) = symbolLocalDataSource.addSymbol(symbol)
}