package pl.deniotokiari.capitalgaincalculator.data.datasource

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.failed
import pl.deniotokiari.capitalgaincalculator.core.success
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.AlphaVantageService
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model.toDataModel

@Factory
class TickerAlphaVantageDataSource(
    private val alphaVantageService: AlphaVantageService
) {
    suspend fun search(query: String): Result<List<Ticker.Search>, DataError> = runCatching {
        alphaVantageService.symbolSearch(query).bestMatches.map { it.toDataModel() }
    }.fold(
        onSuccess = { it.success() },
        onFailure = { DataError(it).failed() }
    )
}