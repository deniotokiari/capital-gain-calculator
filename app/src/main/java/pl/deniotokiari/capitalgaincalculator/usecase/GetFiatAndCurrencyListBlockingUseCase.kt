package pl.deniotokiari.capitalgaincalculator.usecase

import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.core.BlockingUseCase
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyRepository

class GetFiatAndCurrencyListBlockingUseCase(
    private val currencyRepository: CurrencyRepository
) : BlockingUseCase<Unit, Flow<List<Currency>>> {
    override fun invoke(params: Unit): Flow<List<Currency>> = currencyRepository.getCurrencyList()
}