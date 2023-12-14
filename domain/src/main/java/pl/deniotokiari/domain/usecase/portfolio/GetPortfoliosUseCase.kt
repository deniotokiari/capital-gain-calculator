package pl.deniotokiari.domain.usecase.portfolio

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.emitAll
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.FlowUseCase
import pl.deniotokiari.data.currency.repository.CurrencyRepository
import pl.deniotokiari.data.portfolio.repository.PortfolioRepository
import pl.deniotokiari.domain.model.Currency
import pl.deniotokiari.domain.model.Portfolio

@Factory(binds = [GetPortfoliosUseCase::class])
class GetPortfoliosUseCase(
    private val portfolioRepository: PortfolioRepository,
    private val currencyRepository: CurrencyRepository
) : FlowUseCase<Unit, List<Portfolio>> {
    override fun invoke(params: Unit): Flow<List<Portfolio>> = flow {
        val currencies = currencyRepository.getCurrencies().first().associate { it.code to it.name }

        emitAll(
            portfolioRepository
                .getPortfolios()
                .map {
                    it.map { (name, currencyCode) ->
                        Portfolio(
                            name = name,
                            currency = Currency(
                                code = currencyCode,
                                name = currencies[currencyCode]
                            )
                        )
                    }
                }
        )
    }
}
