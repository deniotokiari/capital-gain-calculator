package legacy.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.repository.PortfolioRepository

@Factory(binds = [GetPortfolioNameByIdUseCase::class])
class GetPortfolioNameByIdUseCase(
    private val portfolioRepository: PortfolioRepository
) : UseCase<String, String> {
    override suspend fun invoke(params: String): String = portfolioRepository.getName(params)
}