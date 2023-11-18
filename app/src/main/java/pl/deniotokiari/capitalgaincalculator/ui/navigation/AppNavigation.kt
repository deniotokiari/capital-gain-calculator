@file:OptIn(ExperimentalMaterialNavigationApi::class, ExperimentalMaterial3Api::class)

package pl.deniotokiari.capitalgaincalculator.ui.navigation

import androidx.compose.foundation.layout.ColumnScope
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.runtime.Composable
import androidx.navigation.NamedNavArgument
import androidx.navigation.NavBackStackEntry
import androidx.navigation.NavDeepLink
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavHostController
import androidx.navigation.compose.composable
import com.google.accompanist.navigation.material.ExperimentalMaterialNavigationApi
import com.google.accompanist.navigation.material.bottomSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.HomeScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.InitProfileCurrencyScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.AddPortfolioSheet

class AppNavigation {
    private var controller: NavHostController? = null
    val startDestination: String get() = Route.InitProfileCurrency.name

    fun setController(controller: NavHostController) {
        this.controller = controller
    }

    fun navigationGraph(builder: NavGraphBuilder) {
        with(builder) {
            composable(Route.Home.name) { HomeScreen() }
            composable(Route.About.name) { }
            composable(Route.Settings.name) { }
            composable(Route.InitProfileCurrency.name) { InitProfileCurrencyScreen() }
            sheet(Route.PortfolioAdd.name) { AddPortfolioSheet() }
        }
    }

    fun popBackStack() {
        controller?.popBackStack()
    }

    fun navigateToHomeFromInitProfileCurrency() {
        controller?.navigate(Route.Home.name) {
            popUpTo(Route.InitProfileCurrency.name) {
                inclusive = true
            }
        }
    }

    fun navigateToAbout() {
       controller?.navigate(Route.About.name)
    }

    fun navigateToSettings() {
        controller?.navigate(Route.Settings.name)
    }

    fun navigateToPortfolioAdd() {
        controller?.navigate(Route.PortfolioAdd.name)
    }

    private fun NavGraphBuilder.sheet(
        route: String,
        arguments: List<NamedNavArgument> = emptyList(),
        deepLinks: List<NavDeepLink> = emptyList(),
        content: @Composable ColumnScope.(backstackEntry: NavBackStackEntry) -> Unit
    ) {
        bottomSheet(route, arguments, deepLinks) {
            ModalBottomSheet(onDismissRequest = {
                controller?.popBackStack()
            }) {
                content(this, it)
            }
        }
    }

    sealed class Route(val name: String) {
        object Home : Route("home")
        object About : Route("about")
        object Settings : Route("settings")
        object InitProfileCurrency : Route("init_profile_currency")
        object PortfolioAdd : Route("portfolio_add")
    }
}