package pl.deniotokiari.feature.home.navigation

import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.core.ui.navigation.HostNavigation
import pl.deniotokiari.feature.home.presentation.HomeScreen
import pl.deniotokiari.navigation.AppNavigation

@Named(AppNavigation.HOME_ROUTE)
@Factory
internal fun route() = HostNavigation.Route(
    name = AppNavigation.HOME_ROUTE,
    type = HostNavigation.Route.Type.COMPOSABLE,
    content = { HomeScreen() }
)