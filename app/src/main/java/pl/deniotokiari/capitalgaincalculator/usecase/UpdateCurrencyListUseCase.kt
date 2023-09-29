package pl.deniotokiari.capitalgaincalculator.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyRepository

class UpdateCurrencyListUseCase(
    private val currencyRepository: CurrencyRepository
) : UseCase<Unit, Unit> {
    override suspend fun invoke(params: Unit) {
        currencyRepository.updateCurrencyList()
    }
}