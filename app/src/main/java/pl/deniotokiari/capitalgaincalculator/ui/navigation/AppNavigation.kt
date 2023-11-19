@file:OptIn(ExperimentalMaterialNavigationApi::class, ExperimentalMaterial3Api::class,
    ExperimentalMaterialNavigationApi::class
)

package pl.deniotokiari.capitalgaincalculator.ui.navigation

import androidx.compose.foundation.layout.ColumnScope
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.runtime.Composable
import androidx.navigation.NamedNavArgument
import androidx.navigation.NavBackStackEntry
import androidx.navigation.NavController
import androidx.navigation.NavDeepLink
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavHostController
import androidx.navigation.compose.composable
import com.google.accompanist.navigation.material.ExperimentalMaterialNavigationApi
import com.google.accompanist.navigation.material.bottomSheet
import kotlinx.coroutines.suspendCancellableCoroutine
import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.HomeScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.InitProfileCurrencyScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.PortfolioScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.AddPortfolioSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.TickerSearchSheet
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppNavigation.Route.Companion.getId
import kotlin.coroutines.resume

@Single
class AppNavigation {
    private lateinit var controller: NavHostController
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
            composable(Route.Portfolio.name) { PortfolioScreen(id = it.getId()) }
            sheet(Route.TickerSearch.name) { TickerSearchSheet() }
        }
    }

    fun popBackStack() {
        controller.popBackStack()
    }

    fun <T> popBackStack(value: T) {
        controller.previousBackStackEntry?.savedStateHandle?.set(Route.KEY_VALUE, value)
        controller.popBackStack()
    }

    fun navigateToHomeFromInitProfileCurrency() {
        controller.navigate(Route.Home.name) {
            popUpTo(Route.InitProfileCurrency.name) {
                inclusive = true
            }
        }
    }

    fun navigateToAbout() {
        controller.navigate(Route.About.name)
    }

    fun navigateToSettings() {
        controller.navigate(Route.Settings.name)
    }

    fun navigateToPortfolioAdd() {
        controller.navigate(Route.PortfolioAdd.name)
    }

    fun navigateToPortfolio(id: String) {
        controller.navigate(Route.Portfolio.withArgument(id))
    }

    suspend fun navigateToTickerSearch(): Ticker.Search? = navigateWithResult(Route.TickerSearch)

    private suspend fun <T> navigateWithResult(route: Route): T? {
        val backstackEntry = controller.currentBackStackEntry
        controller.navigate(route.name)

        val result = suspendCancellableCoroutine {
            lateinit var onDestinationChangedListener: NavController.OnDestinationChangedListener

            onDestinationChangedListener =
                NavController.OnDestinationChangedListener { controller, destination, _ ->
                    if (backstackEntry?.destination?.route == destination.route) {
                        controller.removeOnDestinationChangedListener(onDestinationChangedListener)

                        val value = backstackEntry?.savedStateHandle?.get<T>(Route.KEY_VALUE)
                        backstackEntry?.savedStateHandle?.remove<T>(Route.KEY_VALUE)

                        it.resume(value)
                    }
                }

            controller.addOnDestinationChangedListener(onDestinationChangedListener)
        }

        return result
    }

    private fun NavGraphBuilder.sheet(
        route: String,
        arguments: List<NamedNavArgument> = emptyList(),
        deepLinks: List<NavDeepLink> = emptyList(),
        content: @Composable ColumnScope.(backstackEntry: NavBackStackEntry) -> Unit
    ) {
        bottomSheet(route, arguments, deepLinks) {
            ModalBottomSheet(onDismissRequest = {
                controller.popBackStack()
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
        object Portfolio : Route("portfolio/{${ARGUMENT_ID}}")
        object TickerSearch : Route("ticker_search")

        fun withArgument(value: String) = name.replace("{$ARGUMENT_ID}", value)

        companion object {
            const val ARGUMENT_ID = "id"
            const val KEY_VALUE = "value"

            fun NavBackStackEntry.getId(): String = requireNotNull(arguments?.getString(ARGUMENT_ID))
        }
    }
}