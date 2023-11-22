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
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList
) : FlowUseCase<String, List<TickerWithMarketData>> {
    override fun invoke(params: String): Flow<List<TickerWithMarketData>> =
        instrumentDao.positionsByPortfolioId(params).map {
            it.map { (ticker, positions) ->
                val positionsMarketData =
                    positions.map { position ->
                        // TODO convert currency
                        MarketData.from(
                            spent = position.position.price,
                            count = position.position.count,
                            currentPrice = ticker.ticker.price,
                            currency = ticker.currency.toDataModel()
                        )
                    }

                TickerWithMarketData(
                    ticker = ticker.toDataModel(),
                    instrumentId = ticker.ticker.symbol,
                    data = calculateMarketDataFromMarketDataList(positionsMarketData),
                    positions = positions.mapIndexed { index, position ->
                        PositionWithMarketData(
                            position = position.toDataModel(),
                            data = positionsMarketData[index]
                        )
                    }
                )
            }
        }
}