package pl.deniotokiari.capital.gain.calculator.presentation

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Scaffold
import androidx.compose.material.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose.AuthScreen
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.compose.HomeScreen
import pl.deniotokiari.core.misc.compose.LocalNavController
import pl.deniotokiari.core.navigation.route.AuthLogin
import pl.deniotokiari.core.navigation.route.AuthSignup
import pl.deniotokiari.core.navigation.route.AuthType
import pl.deniotokiari.core.navigation.route.Home
import pl.deniotokiari.core.navigation.route.Splash
import pl.deniotokiari.core.navigation.route.StartRoute

@Composable
fun AppScreen() {
    MaterialTheme {
        val navController = rememberNavController()

        var showBackButton by remember { mutableStateOf(false) }

        LaunchedEffect(Unit) {
            navController.currentBackStack.collect { backStackEntryList ->
                showBackButton = backStackEntryList.size > 2
            }
        }

        val viewModel = koinViewModel<AppViewModel>()

        Scaffold(
            topBar = {
                TopAppBar(
                    elevation = 0.dp,
                    title = {},
                    backgroundColor = Color.Transparent,
                    navigationIcon = {
                        if (showBackButton) {
                            IconButton(
                                onClick = { navController.popBackStack() },
                                content = { Icon(Icons.AutoMirrored.Filled.ArrowBack, null) },
                            )
                        }
                    },
                )
            },
        ) {
            CompositionLocalProvider(LocalNavController provides navController) {
                NavHost(
                    navController = navController,
                    startDestination = StartRoute,
                ) {
                    composable<Splash> { SplashScreen() }
                    composable<AuthLogin> { AuthScreen(AuthType.Login) }
                    composable<AuthSignup> { AuthScreen(AuthType.Signup) }
                    composable<Home> { HomeScreen() }
                }
            }
        }

        LaunchedEffect(Unit) {
            viewModel.event.collect { event ->
                when (event) {
                    AppUiAction.AuthRequired -> navController.navigate(
                        route = AuthSignup,
                        builder = {
                            popUpTo(0)
                        },
                    )

                    AppUiAction.NavigateToHome -> navController.navigate(
                        route = Home,
                        builder = {
                            popUpTo(0)
                        },
                    )
                }
            }
        }
    }
}

@Composable
fun SplashScreen() = Box(
    modifier = Modifier.fillMaxSize(),
    contentAlignment = Alignment.Center,
) {
    CircularProgressIndicator()
}
