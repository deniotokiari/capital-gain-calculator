package pl.deniotokiari.navigation

import org.koin.core.annotation.Named
import org.koin.core.annotation.Single
import pl.deniotokiari.core.ui.navigation.HostNavigation
import pl.deniotokiari.core.ui.navigation.withId

@Single(binds = [AppNavigation::class])
class AppNavigation(
    @Named(START_ROUTE) override val startDestination: Route,
    override val destinations: List<Route>
) : HostNavigation() {

    fun navigateToHomeFromInitProfileCurrency() {
        navigate(HOME_ROUTE, popTo = INIT_PROFILE_CURRENCY_ROUTE, inclusive = true)
    }

    fun navigateToAddPortfolio() {
        navigate(ADD_PORTFOLIO_ROUTE)
    }

    fun navigateToPortfolio(id: String) {
        navigateWithId(PORTFOLIO_ROUTE.withId(), id)
    }

    fun navigateToAbout() {

    }

    fun navigateToSettings() {

    }

    fun navigateBack() {
        popBackStack()
    }

    companion object {
        const val INIT_PROFILE_CURRENCY_ROUTE = "INIT_PROFILE_CURRENCY_ROUTE"
        const val HOME_ROUTE = "HOME_ROUTE"
        const val ADD_PORTFOLIO_ROUTE = "ADD_PORTFOLIO_ROUTE"
        const val PORTFOLIO_ROUTE = "PORTFOLIO_ROUTE"

        const val START_ROUTE = INIT_PROFILE_CURRENCY_ROUTE
    }
}