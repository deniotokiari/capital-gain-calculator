package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.mapFailure
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository
import pl.deniotokiari.capitalgaincalculator.domain.model.DomainError
import pl.deniotokiari.capitalgaincalculator.domain.model.toDomainError

class GetCurrenciesUseCase(
    private val currencyRepository: CurrencyRepository
) : FlowUseCase<Unit, Result<List<Currency>, DomainError>> {
    override fun invoke(params: Unit): Flow<Result<List<Currency>, DomainError>> = currencyRepository.currencies().map {
        it.mapFailure { result -> result.toDomainError() }
    }
}