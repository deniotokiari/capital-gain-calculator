package pl.deniotokiari.capitalgaincalculator.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyRepository

class GetCurrencyByCodeUseCase(
    private val currencyRepository: CurrencyRepository
) : UseCase<String, Currency> {
    override suspend fun invoke(params: String): Currency = currencyRepository.getCurrencyByCode(params)
}