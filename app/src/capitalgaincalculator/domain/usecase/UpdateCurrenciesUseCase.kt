package legacy.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.core.mapFailure
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository
import pl.deniotokiari.capitalgaincalculator.domain.model.DomainError
import pl.deniotokiari.capitalgaincalculator.domain.model.toDomainError

@Factory(binds = [UpdateCurrenciesUseCase::class])
class UpdateCurrenciesUseCase(
    private val currencyRepository: CurrencyRepository
) : UseCase<Unit, Result<Unit, DomainError>> {
    override suspend fun invoke(params: Unit): Result<Unit, DomainError> =
        currencyRepository.updateCurrencies().mapFailure { it.toDomainError() }
}