package legacy.capitalgaincalculator.data.repository

import legacy.capitalgaincalculator.data.datasource.TickerDataSource
import legacy.capitalgaincalculator.data.db.DbTicker
import legacy.capitalgaincalculator.data.model.DataError
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.flatMapFailed
import pl.deniotokiari.capitalgaincalculator.core.mapSuccess
import pl.deniotokiari.capitalgaincalculator.core.network.ALPHA_VANTAGE
import pl.deniotokiari.capitalgaincalculator.core.network.POLIGON
import pl.deniotokiari.capitalgaincalculator.core.network.YAHOO_FINANCE
import pl.deniotokiari.capitalgaincalculator.data.datasource.TickerDataSource
import pl.deniotokiari.capitalgaincalculator.data.db.DbTicker
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker

@Factory
class TickerRepository(
    @Named(ALPHA_VANTAGE) private val alphaVantageTickerDataSource: TickerDataSource,
    @Named(YAHOO_FINANCE) private val yahooTickerDataSource: TickerDataSource,
    @Named(POLIGON) private val poligonDataSource: TickerDataSource,
    private val tickerDao: DbTicker.Dao
) {
    suspend fun search(query: String): Result<List<Ticker.Search>, DataError> =
        alphaVantageTickerDataSource.search(query)
            .flatMapFailed { yahooTickerDataSource.search(query) }
            .flatMapFailed { poligonDataSource.search(query) }

    suspend fun price(ticker: String): Result<Ticker.Price, DataError> = alphaVantageTickerDataSource.info(ticker)
        .flatMapFailed { yahooTickerDataSource.info(ticker) }
        .flatMapFailed { poligonDataSource.info(ticker) }

    suspend fun updatePrice(ticker: String) {
        price(ticker).mapSuccess { tickerDao.updatePrice(ticker, it.value) }
    }
}