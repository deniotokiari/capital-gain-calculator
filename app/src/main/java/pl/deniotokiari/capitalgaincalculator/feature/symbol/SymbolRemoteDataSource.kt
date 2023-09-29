package pl.deniotokiari.capitalgaincalculator.feature.symbol

import pl.deniotokiari.capitalgaincalculator.alphavantage.AlphaVantageService
import pl.deniotokiari.capitalgaincalculator.alphavantage.model.SymbolSearchResponse

class SymbolRemoteDataSource(
    private val alphaVantageService: AlphaVantageService
) {
    suspend fun search(query: String): SymbolSearchResponse = alphaVantageService.symbolSearch(keywords = query)
}

