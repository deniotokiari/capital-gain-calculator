package pl.deniotokiari.capitalgaincalculator.usecase

import pl.deniotokiari.capitalgaincalculator.alphavantage.AlphaVantageApiTokenRepository
import pl.deniotokiari.capitalgaincalculator.core.UseCase

class SetAlphaVantageApiKeyUseCase(
    private val alphaVantageApiTokenRepository: AlphaVantageApiTokenRepository
) : UseCase<String, Unit> {
    override suspend fun invoke(params: String) {
        alphaVantageApiTokenRepository.setToken(params)
    }
}