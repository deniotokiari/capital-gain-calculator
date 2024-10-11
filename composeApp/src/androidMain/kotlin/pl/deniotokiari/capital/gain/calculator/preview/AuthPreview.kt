package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiState
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiType
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.CredentialsField
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose.AuthContent

@Preview(showBackground = true)
@Composable
fun AuthPreviewLoading() = AuthContent(
    uiState = AuthUiState(type = AuthUiType.Loading),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun AuthPreviewError() = AuthContent(
    uiState = AuthUiState(type = AuthUiType.Error),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun AuthPreviewLogin() = AuthContent(
    uiState = AuthUiState(type = AuthUiType.Login),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun AuthPreviewSignup() = AuthContent(
    uiState = AuthUiState(type = AuthUiType.Signup),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun AuthPreviewSignupEmailAndPasswordError() = AuthContent(
    uiState = AuthUiState(
        type = AuthUiType.Signup,
        email = CredentialsField(value = "email@email.com", error = true),
        password = CredentialsField(value = "password", error = true),
    ),
    onAction = {},
)