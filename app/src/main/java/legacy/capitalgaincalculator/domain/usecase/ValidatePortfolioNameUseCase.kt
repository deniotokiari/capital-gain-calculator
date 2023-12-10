package legacy.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.repository.PortfolioRepository

@Factory(binds = [ValidatePortfolioNameUseCase::class])
class ValidatePortfolioNameUseCase(
    private val portfolioRepository: PortfolioRepository
) : UseCase<String, ValidatePortfolioNameUseCase.ValidationResult> {
    override suspend fun invoke(params: String): ValidationResult {
        return if (params.isNotEmpty() && params.isNotBlank() && !portfolioRepository.exists(params)) {
            ValidationResult.Valid
        } else {
            ValidationResult.Invalid
        }
    }

    sealed class ValidationResult {
        object Valid : ValidationResult()
        object Invalid : ValidationResult()
    }
}