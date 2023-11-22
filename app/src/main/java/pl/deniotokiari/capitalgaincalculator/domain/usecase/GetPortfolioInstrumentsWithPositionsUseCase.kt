package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.domain.model.PositionWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.TickerWithMarketData

@Factory(binds = [GetPortfolioInstrumentsWithPositionsUseCase::class])
class GetPortfolioInstrumentsWithPositionsUseCase(
    private val instrumentDao: DbInstrument.Dao
) : FlowUseCase<String, List<TickerWithMarketData>> {
    override fun invoke(params: String): Flow<List<TickerWithMarketData>> =
        instrumentDao.positionsByPortfolioId(params).map {
            it.map { (ticker, positions) ->
                TickerWithMarketData(
                    ticker = ticker.toDataModel(),
                    instrumentId = ticker.ticker.symbol,
                    data = null,
                    positions = positions.map { position ->
                        PositionWithMarketData(
                            position = position.toDataModel(),
                            data = null
                        )
                    }
                )
            }
        }
}