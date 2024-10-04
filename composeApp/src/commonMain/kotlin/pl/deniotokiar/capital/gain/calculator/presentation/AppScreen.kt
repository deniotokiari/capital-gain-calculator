package pl.deniotokiar.capital.gain.calculator.presentation

import androidx.compose.material.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import pl.deniotokiar.capital.gain.calculator.navigation.Greeting
import pl.deniotokiar.capital.gain.calculator.navigation.Home
import pl.deniotokiari.core.misc.compose.LocalNavController

@Composable
fun AppScreen() {
    MaterialTheme {
        val navController = rememberNavController()

        CompositionLocalProvider(LocalNavController provides navController) {
            NavHost(
                navController = navController,
                startDestination = Home,
            ) {
                composable<Home> {
                    HomeScreen()
                }
                composable<Greeting> {
                    GreetScreen()
                }
            }
        }
    }
}