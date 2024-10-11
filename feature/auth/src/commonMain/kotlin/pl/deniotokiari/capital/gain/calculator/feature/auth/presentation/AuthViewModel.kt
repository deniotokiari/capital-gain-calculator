package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.IsAuthRequiredUseCase
import pl.deniotokiari.core.misc.AppDispatchers

class AuthViewModel(
    private val isAuthRequiredUseCase: IsAuthRequiredUseCase,
    private val appDispatchers: AppDispatchers,
) : ViewModel() {
    private val _event = MutableSharedFlow<AuthUiEvent>()
    val event: SharedFlow<AuthUiEvent> get() = _event

    private val _uiState = MutableStateFlow(AuthUiState(type = AuthUiType.Loading))
    val uiState: StateFlow<AuthUiState> get() = _uiState

    init {
        viewModelScope.launch(appDispatchers.default) {
            if (isAuthRequiredUseCase(Unit)) {
                _uiState.update { it.copy(type = AuthUiType.Signup) }
            } else {
                _event.emit(AuthUiEvent.NavigateToHome)
            }
        }
    }

    fun onAction(action: AuthUiAction) {
        when (action) {
            is AuthUiAction.EmailChanged -> onEmailChange(action.value)
            is AuthUiAction.PasswordChanged -> onPasswordChange(action.value)
            AuthUiAction.Login -> onLogin()
            AuthUiAction.NavigateToLogin -> onNavigateToLogin()
            AuthUiAction.Retry -> onRetry()
            AuthUiAction.Signup -> onSignup()
        }
    }

    private fun onEmailChange(email: String) {
        _uiState.update { state -> state.copy(email = state.email.copy(value = email)) }
    }

    private fun onPasswordChange(password: String) {
        _uiState.update { state -> state.copy(password = state.password.copy(value = password)) }
    }

    private fun onRetry() {

    }

    private fun onLogin() {

    }

    private fun onSignup() {

    }

    private fun onNavigateToLogin() {
        _uiState.update { it.copy(type = AuthUiType.Login) }
    }
}