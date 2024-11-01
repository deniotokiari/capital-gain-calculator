package pl.deniotokiari.capital.gain.calculator.gateway.di

import org.koin.core.module.dsl.factoryOf
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.gateway.domain.usecase.GetUsdCurrencyUseCase
import pl.deniotokiari.capital.gain.calculator.gateway.domain.usecase.SaveSettingsUseCase

val gateWayModule = module {
    factoryOf(::GetUsdCurrencyUseCase)
    factoryOf(::SaveSettingsUseCase)

}