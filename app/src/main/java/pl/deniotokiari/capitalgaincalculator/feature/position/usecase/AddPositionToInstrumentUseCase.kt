package pl.deniotokiari.capitalgaincalculator.feature.position.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.feature.position.Position
import pl.deniotokiari.capitalgaincalculator.feature.position.PositionRepository

class AddPositionToInstrumentUseCase(
    private val positionRepository: PositionRepository
) : UseCase<AddPositionToInstrumentUseCase.Params, Unit> {
    override suspend fun invoke(params: Params) {
        positionRepository.addPosition(
            instrumentId = params.instrumentId,
            position = params.position
        )
    }

    data class Params(
        val instrumentId: String,
        val position: Position
    )
}