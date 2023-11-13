package pl.deniotokiari.capitalgaincalculator.data

import org.koin.core.module.dsl.factoryOf
import org.koin.dsl.bind
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.data.datasource.ApiKeyDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.ApiKeyLocalDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyAlphaVantageDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.CurrencyLocalDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.ProfileDataSource
import pl.deniotokiari.capitalgaincalculator.data.datasource.ProfileLocalDataSource
import pl.deniotokiari.capitalgaincalculator.data.repository.ApiKeyRepository
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository
import pl.deniotokiari.capitalgaincalculator.data.repository.ProfileRepository

val dataModule = module {
    // data source
    factoryOf(::ApiKeyLocalDataSource) bind ApiKeyDataSource::class
    factoryOf(::ProfileLocalDataSource) bind ProfileDataSource::class
    factoryOf(::CurrencyAlphaVantageDataSource)
    factoryOf(::CurrencyLocalDataSource)

    // repository
    factoryOf(::ApiKeyRepository)
    factoryOf(::ProfileRepository)
    factoryOf(::CurrencyRepository)
}