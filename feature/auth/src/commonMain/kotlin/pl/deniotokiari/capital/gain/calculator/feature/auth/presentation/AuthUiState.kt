package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation

data class AuthUiState(
    val email: CredentialsField = CredentialsField(""),
    val password: CredentialsField = CredentialsField(""),
    val type: AuthUiType,
)

data class CredentialsField(
    val value: String,
    val error: Boolean = false,
)

sealed interface AuthUiType {
    data object Loading : AuthUiType
    data object Error : AuthUiType
    data object Login : AuthUiType
    data object Signup : AuthUiType
}

sealed interface AuthUiEvent {
    data object NavigateToHome : AuthUiEvent
}

sealed interface AuthUiAction {
    data class EmailChanged(val value: String) : AuthUiAction
    data class PasswordChanged(val value: String) : AuthUiAction
    data object Retry : AuthUiAction
    data object Login : AuthUiAction
    data object Signup : AuthUiAction
    data object NavigateToLogin : AuthUiAction
}
