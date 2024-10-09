package pl.deniotokiari.capital.gain.calculator.feature.auth.di

import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.auth.data.getPlatformAuthDataSource
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource

val authModule = module {
    factory<AuthDataSource> { getPlatformAuthDataSource() }
}