package pl.deniotokiari.capitalgaincalculator.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import org.koin.androidx.compose.koinViewModel
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capitalgaincalculator.feature.home.HomeScreen
import pl.deniotokiari.capitalgaincalculator.feature.initialization.InitializationScreen
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioScreen
import pl.deniotokiari.capitalgaincalculator.feature.splash.SplashScreen

@Composable
fun AppNavigation(navController: NavHostController) = NavHost(
    navController = navController,
    startDestination = Route.Loading.route
) {
    composable(Route.Loading.route) { SplashScreen() }
    composable(Route.Home.route) { HomeScreen(koinViewModel()) }
    composable(Route.Initialize.route) { InitializationScreen(koinViewModel()) }
    composable(Route.Portfolio.route) { backStackEntry ->
        val id = requireNotNull(backStackEntry.arguments?.getString("id"))

        PortfolioScreen(viewModel = koinViewModel(parameters = { parametersOf(id) }))
    }
}
