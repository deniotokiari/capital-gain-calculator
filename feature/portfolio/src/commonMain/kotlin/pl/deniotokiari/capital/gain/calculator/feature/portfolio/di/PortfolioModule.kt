package pl.deniotokiari.capital.gain.calculator.feature.portfolio.di

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.bind
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.gateway.PortfolioFeatureUiGateway
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.PortfoliosViewModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.portfolio.PortfolioUiGateway

val portfolioModule = module {
    viewModelOf(::PortfoliosViewModel)

    factoryOf(::PortfolioFeatureUiGateway) bind PortfolioUiGateway::class
}
