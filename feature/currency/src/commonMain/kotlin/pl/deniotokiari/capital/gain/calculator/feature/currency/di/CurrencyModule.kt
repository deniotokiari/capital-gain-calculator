package pl.deniotokiari.capital.gain.calculator.feature.currency.di

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.viewModel
import org.koin.core.qualifier.named
import org.koin.dsl.bind
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.AlphaVantageCurrenciesRemoteDataSource
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesLocalDataSource
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesRepository
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesRepositoryImpl
import pl.deniotokiari.capital.gain.calculator.feature.currency.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.capital.gain.calculator.feature.currency.gateway.CurrencyFeatureGateway
import pl.deniotokiari.capital.gain.calculator.feature.currency.gateway.CurrencyFeatureUiGateway
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListViewModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGateway
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyUiGateway
import pl.deniotokiari.core.misc.HttpClient

object CurrencyHttpClient

val currencyModule = module {
    single(qualifier = named<CurrencyHttpClient>()) { HttpClient() }

    factory {
        AlphaVantageCurrenciesRemoteDataSource(
            httpClient = get(qualifier = named<CurrencyHttpClient>()),
        )
    }

    factoryOf(::CurrenciesLocalDataSource)
    factoryOf(::CurrenciesRepositoryImpl) bind CurrenciesRepository::class
    factoryOf(::GetCurrenciesUseCase)
    factoryOf<CurrencyUiGateway>(::CurrencyFeatureUiGateway)
    factoryOf(::CurrencyFeatureGateway) bind CurrencyGateway::class

    viewModel { args ->
        CurrenciesListViewModel(
            initialCurrency = args[0],
            getCurrenciesUseCase = get(),
            appDispatchers = get(),
        )
    }
}
