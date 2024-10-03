package pl.deniotokiar.capital.gain.calculator.di

import org.koin.core.module.dsl.factoryOf
import org.koin.dsl.module
import pl.deniotokiar.capital.gain.calculator.Greeting
import pl.deniotokiar.capital.gain.calculator.Platform
import pl.deniotokiar.capital.gain.calculator.getPlatform

// global dependencies
val appModule = module {
    factory<Platform> { getPlatform() }
    factoryOf(::Greeting)
}