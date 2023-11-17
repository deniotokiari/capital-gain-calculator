package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Portfolio
import pl.deniotokiari.capitalgaincalculator.data.repository.PortfolioRepository

@Factory(binds = [AddPortfolioUseCase::class])
class AddPortfolioUseCase(
    private val portfolioRepository: PortfolioRepository
): UseCase<Portfolio, Unit> {
    override suspend fun invoke(params: Portfolio) {
        portfolioRepository.addPortfolio(params)
    }
}