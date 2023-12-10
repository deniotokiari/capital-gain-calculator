package pl.deniotokiari.navigation

import org.koin.core.annotation.Factory
import org.koin.core.annotation.Named
import pl.deniotokiari.core.ui.navigation.HostNavigation

@Factory(binds = [AppNavigation::class])
class AppNavigation(
    @Named(START_ROUTE) override val startDestination: Route,
    override val destinations: List<Route>
) : HostNavigation() {

    companion object {
        const val INIT_PROFILE_CURRENCY_ROUTE = "INIT_PROFILE_CURRENCY_ROUTE"
        const val HOME_ROUTE = "HOME_ROUTE"

        const val START_ROUTE = INIT_PROFILE_CURRENCY_ROUTE
    }
}