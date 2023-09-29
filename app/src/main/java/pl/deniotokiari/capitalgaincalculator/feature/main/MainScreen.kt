package pl.deniotokiari.capitalgaincalculator.feature.main

import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.getValue
import androidx.navigation.NavHostController
import androidx.navigation.NavOptions
import org.koin.core.context.GlobalContext.get
import pl.deniotokiari.capitalgaincalculator.navigation.AppNavigation
import pl.deniotokiari.capitalgaincalculator.navigation.Route

val LocalNavController = compositionLocalOf { NavHostController(get().get()) }

@Composable
fun MainScreen(navHostController: NavHostController, mainViewModel: MainViewModel) {
    val uiState: MainViewModel.UiState by mainViewModel.uiState.collectAsState()

    CompositionLocalProvider(LocalNavController provides navHostController) {
        AppNavigation(navController = navHostController)
    }

    val destination = when (uiState) {
        MainViewModel.UiState.Initialized -> Route.Home
        MainViewModel.UiState.Loading -> Route.Loading
        MainViewModel.UiState.RequestInitialization -> Route.Initialize
    }

    if (navHostController.currentDestination?.route != destination.route) {
        navHostController.navigate(
            route = destination.route,
            navOptions = NavOptions
                .Builder()
                .setPopUpTo(navHostController.currentDestination?.route, inclusive = true)
                .build()
        )
    }
}