package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiEvent
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiState
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthViewModel
import pl.deniotokiari.core.misc.compose.LocalNavController
import pl.deniotokiari.core.navigation.route.Auth
import pl.deniotokiari.core.navigation.route.Home

@Composable
fun AuthScreen() {
    val navController = LocalNavController.current
    val viewModel = koinViewModel<AuthViewModel>()
    val uiState by viewModel.uiState.collectAsState()

    LaunchedEffect(Unit) {
        viewModel.event.collect { event ->
            when (event) {
                AuthUiEvent.NavigateToHome -> navController?.navigate(
                    route = Home,
                    builder = { popUpTo(Auth) { inclusive = true } },
                )
            }
        }
    }

    AuthContent(
        uiState = uiState,
    )
}

@Composable
fun AuthContent(
    uiState: AuthUiState,
) {
    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        when (uiState) {
            AuthUiState.Error -> TODO()
            AuthUiState.Loading -> CircularProgressIndicator()
            AuthUiState.Login -> TODO()
            AuthUiState.SignUp -> TODO()
        }
    }
}