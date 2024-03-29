package legacy.capitalgaincalculator.data.datasource

import legacy.capitalgaincalculator.data.model.DataError
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.capitalgaincalculator.core.Failed
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.failed
import pl.deniotokiari.capitalgaincalculator.core.network.ALPHA_VANTAGE
import pl.deniotokiari.capitalgaincalculator.core.network.POLIGON
import pl.deniotokiari.capitalgaincalculator.core.network.YAHOO_FINANCE
import pl.deniotokiari.capitalgaincalculator.core.success
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.AlphaVantageService
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model.toDataModel
import pl.deniotokiari.capitalgaincalculator.data.service.poligon.PoligonService
import pl.deniotokiari.capitalgaincalculator.data.service.poligon.model.toDataModel
import pl.deniotokiari.capitalgaincalculator.data.service.yahoo.YahooFinanceService
import pl.deniotokiari.capitalgaincalculator.data.service.yahoo.model.toDataModel
import java.math.BigDecimal

interface TickerDataSource {
    suspend fun search(query: String): Result<List<Ticker.Search>, DataError>

    suspend fun info(ticker: String): Result<Ticker.Price, DataError>
}

@Named(ALPHA_VANTAGE)
@Factory
class TickerAlphaVantageDataSource(
    private val alphaVantageService: AlphaVantageService
) : TickerDataSource {
    override suspend fun search(query: String): Result<List<Ticker.Search>, DataError> = runCatching {
        alphaVantageService.symbolSearch(query).bestMatches.map { it.toDataModel() }
    }.fold(
        onSuccess = { successOrFailedOnCondition(it.isEmpty(), it) },
        onFailure = { DataError(it).failed() }
    )

    override suspend fun info(ticker: String): Result<Ticker.Price, DataError> = runCatching {
        alphaVantageService.quote(ticker).globalQuote.price.toBigDecimal().let(Ticker::Price)
    }.fold(
        onSuccess = { it.success() },
        onFailure = { DataError(it).failed() }
    )
}

@Named(POLIGON)
@Factory
class TickerPoligonDataSource(
    private val poligonService: PoligonService
) : TickerDataSource {
    override suspend fun search(query: String): Result<List<Ticker.Search>, DataError> = runCatching {
        poligonService.tickers(query).results.map { it.toDataModel() }
    }.fold(
        onSuccess = { successOrFailedOnCondition(it.isEmpty(), it) },
        onFailure = { DataError(it).failed() }
    )

    override suspend fun info(ticker: String): Result<Ticker.Price, DataError> = runCatching {
        poligonService.previousClose(ticker).results.first().close.toBigDecimal().let(Ticker::Price)
    }.fold(
        onSuccess = { it.success() },
        onFailure = { DataError(it).failed() }
    )
}

@Named(YAHOO_FINANCE)
@Factory
class TickerYahooDataSource(
    private val yahooFinanceService: YahooFinanceService
) : TickerDataSource {
    private val priceMap = mutableMapOf<String, BigDecimal>()

    override suspend fun search(query: String): Result<List<Ticker.Search>, DataError> = runCatching {
        val autocompleteResult = yahooFinanceService.autocomplete(query).resultSet.result

        if (autocompleteResult.isNotEmpty()) {
            val quoteResult = yahooFinanceService.quote(
                autocompleteResult
                    .take(10)
                    .joinToString(separator = ",") { it.symbol }
            ).quoteResponse.result.associateBy { it.symbol }

            priceMap.putAll(quoteResult.mapValues { (_, quote) -> quote.regularMarketPrice.toBigDecimal() })

            autocompleteResult.map { it.toDataModel(quoteResult[it.symbol]) }
        } else {
            emptyList()
        }
    }.fold(
        onSuccess = { successOrFailedOnCondition(it.isEmpty(), it) },
        onFailure = { DataError(it).failed() }
    )

    override suspend fun info(ticker: String): Result<Ticker.Price, DataError> = runCatching {
        if (priceMap.contains(ticker)) {
            requireNotNull(priceMap[ticker]).let(Ticker::Price)
        } else {
            yahooFinanceService.quote(ticker).quoteResponse.result.first().regularMarketPrice.toBigDecimal()
                .let(Ticker::Price)
        }
    }.fold(
        onSuccess = { it.success() },
        onFailure = { DataError(it).failed() }
    )
}

private fun <T> successOrFailedOnCondition(condition: Boolean, result: T): Result<T, DataError> = if (condition) {
    Failed(DataError(Exception("Empty result")))
} else {
    result.success()
}