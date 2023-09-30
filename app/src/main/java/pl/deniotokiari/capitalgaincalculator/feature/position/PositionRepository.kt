package pl.deniotokiari.capitalgaincalculator.feature.position

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import pl.deniotokiari.capitalgaincalculator.currency.toDbCurrency

class PositionRepository(
    private val positionDao: PositionDao
) {
    suspend fun addPosition(
        instrumentId: String,
        position: Position
    ) = positionDao.insert(
        DbPosition(
            instrumentId = instrumentId,
            count = position.count,
            price = position.price.value,
            currencyId = position.price.currency.toDbCurrency().id,
            date = position.date
        )
    )

    fun getPositionsByInstrumentId(instrumentId: String): Flow<List<Position>> = positionDao
        .positionsByInstrumentId(instrumentId)
        .map { items ->
            items.map { item -> item.toPosition() }
        }
}