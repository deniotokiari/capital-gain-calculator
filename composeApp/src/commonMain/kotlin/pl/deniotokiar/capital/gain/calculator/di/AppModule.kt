package pl.deniotokiar.capital.gain.calculator.di

import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module
import pl.deniotokiar.capital.gain.calculator.Platform
import pl.deniotokiar.capital.gain.calculator.getPlatform
import pl.deniotokiar.capital.gain.calculator.presentation.GreetViewModel

// global dependencies
val appModule = module {
    factory<Platform> { getPlatform() }
    viewModelOf(::GreetViewModel)
}