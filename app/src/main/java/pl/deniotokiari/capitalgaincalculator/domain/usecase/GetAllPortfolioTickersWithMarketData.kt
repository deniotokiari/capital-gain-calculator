package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.domain.model.TickerWithMarketData

@Factory(binds = [GetAllPortfolioTickersWithMarketData::class])
class GetAllPortfolioTickersWithMarketData(
    private val instrumentDao: DbInstrument.Dao
) : FlowUseCase<String, List<TickerWithMarketData>> {
    override fun invoke(params: String): Flow<List<TickerWithMarketData>> =
        instrumentDao.instrumentsByPortfolioId(params, DbInstrument.Type.Ticker).map {
            it.map { item ->
                TickerWithMarketData(
                    ticker = item.ticker.toDataModel(),
                    data = null
                )
            }
        }
}