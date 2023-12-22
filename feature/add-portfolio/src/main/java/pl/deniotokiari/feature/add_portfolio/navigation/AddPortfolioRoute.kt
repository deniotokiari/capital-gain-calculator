package pl.deniotokiari.feature.add_portfolio.navigation

import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.core.ui.navigation.HostNavigation
import pl.deniotokiari.feature.add_portfolio.presentation.AddPortfolioSheet
import pl.deniotokiari.navigation.AppNavigation

@Named(AppNavigation.ADD_PORTFOLIO_ROUTE)
@Factory
internal fun route() = HostNavigation.Route(
    name = AppNavigation.ADD_PORTFOLIO_ROUTE,
    type = HostNavigation.Route.Type.SHEET,
    content = { AddPortfolioSheet() }
)