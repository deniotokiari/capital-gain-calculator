package legacy.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository

@Factory(binds = [GetCurrenciesUseCase::class])
class GetCurrenciesUseCase(
    private val currencyRepository: CurrencyRepository
) : FlowUseCase<Unit, List<Currency>> {
    override fun invoke(params: Unit): Flow<List<Currency>> = currencyRepository.currencies()
}