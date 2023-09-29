package pl.deniotokiari.capitalgaincalculator.feature.position

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.currency.toDbCurrency
import java.time.LocalDateTime

class PositionRepository(
    private val positionDao: PositionDao
) {
    suspend fun addPosition(
        instrumentId: String,
        count: Double,
        price: CurrencyValue,
        date: LocalDateTime
    ) = positionDao.insert(
        DbPosition(
            instrumentId = instrumentId,
            count = count,
            price = price.value,
            currencyId = price.currency.toDbCurrency().id,
            date = date
        )
    )

    fun getPositionsByInstrumentId(instrumentId: String): Flow<List<Position>> = positionDao
        .positionsByInstrumentId(instrumentId)
        .map { items ->
            items.map { item -> item.toPosition() }
        }
}