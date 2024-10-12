package pl.deniotokiari.capital.gain.calculator.presentation

import androidx.compose.material.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose.AuthScreen
import pl.deniotokiari.core.misc.compose.LocalNavController
import pl.deniotokiari.core.navigation.route.AuthLogin
import pl.deniotokiari.core.navigation.route.AuthSignup
import pl.deniotokiari.core.navigation.route.AuthType
import pl.deniotokiari.core.navigation.route.Home

@Composable
fun AppScreen() {
    MaterialTheme {
        val navController = rememberNavController()

        CompositionLocalProvider(LocalNavController provides navController) {
            NavHost(
                navController = navController,
                startDestination = AuthSignup,
            ) {
                composable<AuthLogin> { AuthScreen(AuthType.Login) }
                composable<AuthSignup> { AuthScreen(AuthType.Signup) }
                composable<Home> { HomeScreen() }
            }
        }
    }
}