package pl.deniotokiari.capitalgaincalculator.usecase

import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.alphavantage.AlphaVantageApiTokenRepository
import pl.deniotokiari.capitalgaincalculator.core.BlockingUseCase

class GetAlphaVantageApiBlockingUseCase(
    private val alphaVantageApiTokenRepository: AlphaVantageApiTokenRepository
) : BlockingUseCase<Unit, Flow<String?>> {
    override fun invoke(params: Unit): Flow<String?> =
        alphaVantageApiTokenRepository.getToken()
}