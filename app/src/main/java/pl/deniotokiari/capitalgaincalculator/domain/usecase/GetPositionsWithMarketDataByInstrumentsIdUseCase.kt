package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbPosition
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.domain.model.PositionWithMarketData

@Factory(binds = [GetPositionsWithMarketDataByInstrumentsIdUseCase::class])
class GetPositionsWithMarketDataByInstrumentsIdUseCase(
    private val positionDao: DbPosition.Dao
) :
    FlowUseCase<List<String>, Map<String, List<PositionWithMarketData>>> {
    override fun invoke(params: List<String>): Flow<Map<String, List<PositionWithMarketData>>> =
        positionDao.positionsByInstrumentsId(params).map {
            val map = mutableMapOf<String, MutableList<PositionWithMarketData>>()

            for (item in it) {
                val items = map[item.position.instrumentId] ?: mutableListOf()

                items.add(
                    PositionWithMarketData(
                        position = item.toDataModel(),
                        marketData = null
                    )
                )

                map[item.position.instrumentId] = items
            }

            map
        }
}