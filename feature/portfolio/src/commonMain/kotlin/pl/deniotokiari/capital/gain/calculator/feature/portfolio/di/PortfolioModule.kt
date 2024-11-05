package pl.deniotokiari.capital.gain.calculator.feature.portfolio.di

import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.PortfoliosViewModel

val portfolioModule = module {
    viewModelOf(::PortfoliosViewModel)
}