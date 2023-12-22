package pl.deniotokiari.feature.portfolio.navigation

import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.core.ui.navigation.HostNavigation
import pl.deniotokiari.core.ui.navigation.withId
import pl.deniotokiari.feature.portfolio.presentation.PortfolioScreen
import pl.deniotokiari.navigation.AppNavigation

@Named(AppNavigation.PORTFOLIO_ROUTE)
@Factory
internal fun route() = HostNavigation.Route(
    name = AppNavigation.PORTFOLIO_ROUTE.withId(),
    type = HostNavigation.Route.Type.COMPOSABLE,
    content = { PortfolioScreen(id = requireNotNull(it)) }
)