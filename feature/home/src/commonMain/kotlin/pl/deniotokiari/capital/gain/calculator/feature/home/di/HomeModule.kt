package pl.deniotokiari.capital.gain.calculator.feature.home.di

import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.HomeViewModel

val homeModule = module {
    viewModelOf(::HomeViewModel)
}
