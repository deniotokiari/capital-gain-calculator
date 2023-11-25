package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.PositionWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.TickerWithMarketData

@Factory(binds = [GetPortfolioInstrumentsWithPositionsUseCase::class])
class GetPortfolioInstrumentsWithPositionsUseCase(
    private val instrumentDao: DbInstrument.Dao,
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList,
    private val convertCurrencyValueUseCase: ConvertCurrencyValueUseCase
) : FlowUseCase<String, List<TickerWithMarketData>> {
    override fun invoke(params: String): Flow<List<TickerWithMarketData>> =
        instrumentDao.positionsByPortfolioId(params).map {
            it.map { (ticker, positions) ->
                val tickerCurrency = ticker.currency.toDataModel()
                val positionsMarketData =
                    positions.map { position ->
                        val model = position.toDataModel()

                        MarketData.from(
                            spent = convertCurrencyValueUseCase(model.price to tickerCurrency).value,
                            count = position.position.count,
                            currentPrice = ticker.ticker.price,
                            currency = tickerCurrency
                        ) to model
                    }

                TickerWithMarketData(
                    ticker = ticker.toDataModel(),
                    instrumentId = ticker.ticker.symbol,
                    data = calculateMarketDataFromMarketDataList(
                        CalculateMarketDataFromMarketDataList.Params(
                            tickerCurrency,
                            positionsMarketData.map { (data, _) -> data })
                    ),
                    positions = positionsMarketData.map { (data, position) ->
                        PositionWithMarketData(
                            position = position,
                            data = data
                        )
                    }
                )
            }
        }
}