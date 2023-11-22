package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbPosition
import pl.deniotokiari.capitalgaincalculator.data.model.Position

@Factory(binds = [AddPositionToInstrument::class])
class AddPositionToInstrument(
    private val positionDao: DbPosition.Dao
) : UseCase<AddPositionToInstrument.Params, Unit> {
    override suspend fun invoke(params: Params) {
        positionDao.addPosition(
            DbPosition.Model(
                instrumentId = params.instrumentId,
                count = params.position.count,
                price = params.position.price.value,
                currencyCode = params.position.price.currency.code.value,
                date = params.position.date,
                portfolioId = params.portfolioId
            )
        )
    }

    data class Params(
        val instrumentId: String,
        val portfolioId: String,
        val position: Position
    )
}