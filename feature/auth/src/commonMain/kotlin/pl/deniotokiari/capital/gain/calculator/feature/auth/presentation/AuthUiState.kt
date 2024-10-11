package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation

sealed interface AuthUiState {
    data object Loading : AuthUiState
    data object Error : AuthUiState
    data object Login : AuthUiState
    data object Signup : AuthUiState
}

sealed interface AuthUiEvent {
    data object NavigateToHome : AuthUiEvent
}