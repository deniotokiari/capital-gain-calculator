package pl.deniotokiar.capital.gain.calculator.presentation

import androidx.compose.material.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.compositionLocalOf
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import pl.deniotokiar.capital.gain.calculator.navigation.Greeting
import pl.deniotokiar.capital.gain.calculator.navigation.Home

@Composable
fun AppScreen() {
    MaterialTheme {
        val navController = rememberNavController()

        CompositionLocalProvider(LocalNavController provides navController) {
            NavHost(
                navController = navController,
                startDestination = Home.name,
            ) {
                composable(Home.name) {
                    HomeScreen()
                }
                composable(Greeting.name) {
                    GreetScreen()
                }
            }
        }
    }
}

val LocalNavController = compositionLocalOf<NavController?> { null }