package pl.deniotokiari.capital.gain.calculator.feature.currency.domain.usecase

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesRepository
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.usecase.UseCase

class GetCurrenciesUseCase(
    private val currenciesRepository: CurrenciesRepository,
) : UseCase<Unit, Result<List<Currency>, Exception>> {
    override suspend fun invoke(input: Unit): Result<List<Currency>, Exception> =
        currenciesRepository
            .getPhysicalCurrencies(force = false)
}
