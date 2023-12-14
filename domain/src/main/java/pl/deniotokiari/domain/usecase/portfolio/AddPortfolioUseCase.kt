package pl.deniotokiari.domain.usecase.portfolio

import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.UseCase
import pl.deniotokiari.data.portfolio.model.Portfolio
import pl.deniotokiari.data.portfolio.repository.PortfolioRepository

@Factory(binds = [AddPortfolioUseCase::class])
class AddPortfolioUseCase(
    private val portfolioRepository: PortfolioRepository
) : UseCase<AddPortfolioUseCase.Params, Unit> {
    override suspend fun invoke(params: Params) {
        portfolioRepository.addPortfolio(
            Portfolio(
                name = params.name,
                currencyCode = params.currencyCode
            )
        )
    }

    data class Params(
        val name: String,
        val currencyCode: String
    )
}