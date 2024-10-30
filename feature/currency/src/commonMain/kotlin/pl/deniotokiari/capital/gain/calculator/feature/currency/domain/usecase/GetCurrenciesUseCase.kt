package pl.deniotokiari.capital.gain.calculator.feature.currency.domain.usecase

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesRepository
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import pl.deniotokiari.core.misc.usecase.UseCase

class GetCurrenciesUseCase(
    private val currenciesRepository: CurrenciesRepository,
) : UseCase<Unit, Result<List<Currency>, Exception>> {
    override suspend fun invoke(input: Unit): Result<List<Currency>, Exception> =
        currenciesRepository
            .getPhysicalCurrencies(force = false)
            .fold(
                onSuccess = { result ->
                    result.ok()
                },
                onFailure = { error ->
                    Exception(error).error()
                },
            )
}