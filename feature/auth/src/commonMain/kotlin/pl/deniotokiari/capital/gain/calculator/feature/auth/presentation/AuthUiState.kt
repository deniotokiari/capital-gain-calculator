package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation

import pl.deniotokiari.core.navigation.route.AuthType

data class AuthUiState(
    val email: CredentialsField = CredentialsField(""),
    val password: CredentialsField = CredentialsField(""),
    val type: AuthUiType,
)

data class CredentialsField(
    val value: String,
    val error: Boolean = false,
    val enabled: Boolean = true,
)

sealed interface AuthUiType {
    data object Loading : AuthUiType
    data object Login : AuthUiType
    data object Signup : AuthUiType
}

sealed interface AuthUiEvent {
    data object NavigateToHome : AuthUiEvent
    data object NavigateToLogin : AuthUiEvent
    data object Error : AuthUiEvent
}

sealed interface AuthUiAction {
    data class EmailChanged(val value: String) : AuthUiAction
    data class PasswordChanged(val value: String) : AuthUiAction
    data object Retry : AuthUiAction
    data object Login : AuthUiAction
    data object Signup : AuthUiAction
    data object NavigateToLogin : AuthUiAction
}

val AuthType.toUiType: AuthUiType
    get() = when (this) {
        AuthType.Login -> AuthUiType.Login
        AuthType.Signup -> AuthUiType.Signup
    }