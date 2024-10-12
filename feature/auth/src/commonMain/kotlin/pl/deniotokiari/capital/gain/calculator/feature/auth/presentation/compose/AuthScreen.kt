package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose

import androidx.compose.animation.AnimatedContent
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
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiAction
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiEvent
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiState
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiType
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthViewModel
import pl.deniotokiari.capital.gain.calculator.uikit.compose.GenericErrorWithRetry
import pl.deniotokiari.core.misc.compose.LocalNavController
import pl.deniotokiari.core.navigation.route.AuthLogin
import pl.deniotokiari.core.navigation.route.AuthSignup
import pl.deniotokiari.core.navigation.route.AuthType
import pl.deniotokiari.core.navigation.route.Home

@Composable
fun AuthScreen(type: AuthType) {
    val navController = LocalNavController.current
    val viewModel = koinViewModel<AuthViewModel>(
        parameters = { parametersOf(type) },
    )
    val uiState by viewModel.uiState.collectAsState()

    LaunchedEffect(Unit) {
        viewModel.event.collect { event ->
            when (event) {
                AuthUiEvent.NavigateToHome -> navController?.navigate(
                    route = Home,
                    builder = { popUpTo(AuthSignup) { inclusive = true } },
                )

                AuthUiEvent.NavigateToLogin -> navController?.navigate(
                    route = AuthLogin,
                )
            }
        }
    }

    AuthContent(
        uiState = uiState,
        onAction = viewModel::onAction,
    )
}

@Composable
fun AuthContent(
    uiState: AuthUiState,
    onAction: (AuthUiAction) -> Unit,
) {
    AnimatedContent(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center,
        targetState = uiState,
        contentKey = { it.type }
    ) { state ->
        Column(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            when (state.type) {
                AuthUiType.Error -> GenericErrorWithRetry(onRetry = { onAction(AuthUiAction.Retry) })
                AuthUiType.Loading -> CircularProgressIndicator()
                AuthUiType.Login -> LoginContent(
                    onAction = onAction,
                )

                AuthUiType.Signup -> SignupContent(
                    email = state.email,
                    password = state.password,
                    onAction = onAction,
                )
            }
        }
    }
}