package pl.deniotokiari.domain.usecase.currency

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.FlowUseCase
import pl.deniotokiari.data.currency.repository.CurrencyRepository
import pl.deniotokiari.domain.model.Currency
import pl.deniotokiari.domain.model.toDomainModelList

@Factory(binds = [GetCurrenciesUseCase::class])
class GetCurrenciesUseCase(
    private val currenciesRepository: CurrencyRepository
) : FlowUseCase<Unit, List<Currency>> {
    override fun invoke(params: Unit): Flow<List<Currency>> =
        currenciesRepository.getCurrencies().map { it.toDomainModelList() }
}