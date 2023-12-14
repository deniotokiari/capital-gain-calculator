package pl.deniotokiari.domain.usecase.portfolio

import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.UseCase
import pl.deniotokiari.data.portfolio.repository.PortfolioRepository

@Factory(binds = [DeletePortfolioUseCase::class])
class DeletePortfolioUseCase(
    private val portfolioRepository: PortfolioRepository
) : UseCase<String, Unit> {
    override suspend fun invoke(params: String) {
        portfolioRepository.deletePortfolio(params)
    }
}