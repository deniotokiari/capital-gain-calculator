package pl.deniotokiari.capital.gain.calculator.presentation

import androidx.compose.material.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose.AuthScreen
import pl.deniotokiari.core.misc.compose.LocalNavController
import pl.deniotokiari.core.navigation.route.Auth
import pl.deniotokiari.core.navigation.route.Home

@Composable
fun AppScreen() {
    MaterialTheme {
        val navController = rememberNavController()

        CompositionLocalProvider(LocalNavController provides navController) {
            NavHost(
                navController = navController,
                startDestination = Auth,
            ) {
                composable<Auth> { AuthScreen() }
                composable<Home> { HomeScreen() }
            }
        }
    }
}