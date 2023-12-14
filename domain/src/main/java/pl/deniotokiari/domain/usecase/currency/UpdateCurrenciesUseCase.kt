package pl.deniotokiari.domain.usecase.currency

import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.Result
import pl.deniotokiari.core.common.UseCase
import pl.deniotokiari.core.common.mapFailure
import pl.deniotokiari.data.currency.repository.CurrencyRepository

@Factory(binds = [UpdateCurrenciesUseCase::class])
class UpdateCurrenciesUseCase(
    private val currenciesRepository: CurrencyRepository
) : UseCase<Unit, Result<Unit, Throwable>> {
    override suspend fun invoke(params: Unit): Result<Unit, Throwable> =
        currenciesRepository.updateCurrencies().mapFailure { it.throwable }
}