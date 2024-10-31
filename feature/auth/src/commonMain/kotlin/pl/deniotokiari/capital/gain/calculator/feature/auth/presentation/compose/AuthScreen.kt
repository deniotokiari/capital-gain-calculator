package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.AlertDialog
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Text
import androidx.compose.material.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_cancel
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_generic_error_message
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_generic_error_title
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_retry
import org.koin.compose.viewmodel.koinViewModel
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiAction
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiEvent
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiState
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiType
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthViewModel
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource
import pl.deniotokiari.core.misc.compose.LocalNavController
import pl.deniotokiari.core.navigation.route.AuthLogin
import pl.deniotokiari.core.navigation.route.AuthType

@Composable
fun AuthScreen(type: AuthType) {
    val navController = LocalNavController.current
    val viewModel = koinViewModel<AuthViewModel>(
        parameters = { parametersOf(type) },
    )
    val uiState by viewModel.uiState.collectAsState()
    var showErrorDialog by remember { mutableStateOf(false) }

    LaunchedEffect(Unit) {
        viewModel.event.collect { event ->
            when (event) {
                AuthUiEvent.NavigateToLogin -> navController?.navigate(
                    route = AuthLogin,
                )

                AuthUiEvent.Error -> showErrorDialog = true
            }
        }
    }

    AuthContent(
        uiState = uiState,
        onAction = viewModel::onAction,
    )

    if (showErrorDialog) {
        AlertDialog(
            title = { Text(stringResource(Res.string.ui_kit_generic_error_title)) },
            text = { Text(stringResource(Res.string.ui_kit_generic_error_message)) },
            onDismissRequest = {
                showErrorDialog = false
                viewModel.onAction(AuthUiAction.RetryCancel)
            },
            confirmButton = {
                TextButton(
                    onClick = {
                        showErrorDialog = false
                        viewModel.onAction(AuthUiAction.Retry)
                    },
                    content = { Text(stringResource(Res.string.ui_kit_retry)) }
                )
            },
            dismissButton = {
                TextButton(
                    onClick = {
                        showErrorDialog = false
                        viewModel.onAction(AuthUiAction.RetryCancel)
                    },
                    content = { Text(stringResource(Res.string.ui_kit_cancel)) }
                )
            }
        )
    }
}

@Composable
fun AuthContent(
    uiState: AuthUiState,
    onAction: (AuthUiAction) -> Unit,
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center,
    ) {
        if (uiState.type == AuthUiType.Loading) {
            CircularProgressIndicator()
        } else {
            when (uiState.type) {
                AuthUiType.Login -> LoginContent(
                    email = uiState.email,
                    password = uiState.password,
                    onAction = onAction,
                )

                AuthUiType.Signup -> SignupContent(
                    initialCurrency = uiState.currency,
                    email = uiState.email,
                    password = uiState.password,
                    onAction = onAction,
                )

                else -> Unit
            }

            if (!uiState.email.enabled || !uiState.password.enabled) {
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = Modifier
                        .fillMaxSize()
                        .clickable(enabled = false) { }
                ) {
                    CircularProgressIndicator()
                }
            }
        }
    }
}