package pl.deniotokiari.capitalgaincalculator.data.repository

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.data.datasource.TickerDataSource
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker

@Factory
class TickerRepository(
    private val tickerDataSource: TickerDataSource
) {
    suspend fun search(query: String): Result<List<Ticker.Search>, DataError> =
        tickerDataSource.search(query)
}