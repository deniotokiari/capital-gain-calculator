package pl.deniotokiari.capital.gain.calculator.feature.currency.di

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.viewModel
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesRepository
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.capital.gain.calculator.feature.currency.gateway.CurrencyFeatureUiGateway
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListViewModel
import pl.deniotokiari.capital.gain.calculator.gateway.currency.CurrencyUiGateway

val currencyPreviewModule = module {
    factory<CurrenciesRepository> {
        object : CurrenciesRepository {
            override suspend fun getPhysicalCurrencies(force: Boolean): Result<List<Currency>> =
                Result.success(
                    listOf(),
                )
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