package pl.deniotokiari.capital.gain.calculator.feature.settings.di

import org.koin.core.module.dsl.factoryOf
import org.koin.dsl.bind
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.settings.data.datasource.SettingsDataSource
import pl.deniotokiari.capital.gain.calculator.feature.settings.data.datasource.SettingsRemoteDataSource
import pl.deniotokiari.capital.gain.calculator.feature.settings.gateway.SettingsFeatureGateway
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGateway

val settingsModule = module {
    factoryOf(::SettingsRemoteDataSource) bind SettingsDataSource::class
    factoryOf(::SettingsFeatureGateway) bind SettingsGateway::class

}