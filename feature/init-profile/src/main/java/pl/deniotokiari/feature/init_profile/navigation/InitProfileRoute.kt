package pl.deniotokiari.feature.init_profile.navigation

import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.core.ui.navigation.HostNavigation
import pl.deniotokiari.feature.init_profile.presentation.InitProfileScreen
import pl.deniotokiari.navigation.AppNavigation

@Named(AppNavigation.INIT_PROFILE_CURRENCY_ROUTE)
@Factory
internal fun route() = HostNavigation.Route(
    name = AppNavigation.INIT_PROFILE_CURRENCY_ROUTE,
    type = HostNavigation.Route.Type.COMPOSABLE,
    content = { InitProfileScreen() }
)