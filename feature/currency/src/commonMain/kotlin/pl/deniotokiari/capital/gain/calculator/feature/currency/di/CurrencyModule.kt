package pl.deniotokiari.capital.gain.calculator.feature.currency.di

import org.koin.core.module.dsl.factoryOf
import org.koin.core.qualifier.named
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.AlphaVantageCurrenciesRemoteDataSource
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesLocalDataSource
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.CurrenciesRepository
import pl.deniotokiari.core.misc.HttpClient

object CurrencyHttpClient

val currencyModule = module {
    single(qualifier = named<CurrencyHttpClient>()) { HttpClient() }

    factoryOf(::AlphaVantageCurrenciesRemoteDataSource)
    factoryOf(::CurrenciesLocalDataSource)
    factoryOf(::CurrenciesRepository)
}