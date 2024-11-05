package pl.deniotokiari.capital.gain.calculator.feature.currency.di

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.viewModel
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesRepository
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.capital.gain.calculator.feature.currency.gateway.CurrencyFeatureUiGateway
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListViewModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyUiGateway
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.ok

val currencyPreviewModule = module {
    factory<CurrenciesRepository> {
        object : CurrenciesRepository {
            override suspend fun getPhysicalCurrencies(force: Boolean): Result<List<Currency>, Exception> =
                listOf<Currency>(
                    Currency.Physical(name = "PLN", code = "PLN"),
                    Currency.Physical(name = "USD", code = "USD"),
                    Currency.Physical(name = "EUR", code = "EUR"),
                ).ok()
        }
    }

    factoryOf<CurrencyUiGateway>(::CurrencyFeatureUiGateway)
    factoryOf(::GetCurrenciesUseCase)

    viewModel { args ->
        CurrenciesListViewModel(
            initialCurrency = args[0],
            getCurrenciesUseCase = get(),
            appDispatchers = get(),
        )
    }
}
