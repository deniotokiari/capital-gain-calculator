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

    private val _uiState = MutableStateFlow<AuthUiState>(AuthUiState.Loading)
    val uiState: StateFlow<AuthUiState> get() = _uiState

    init {
        viewModelScope.launch(appDispatchers.default) {
            if (isAuthRequiredUseCase(Unit)) {
                _uiState.update { AuthUiState.Login }
            } else {
                _event.emit(AuthUiEvent.NavigateToHome)
            }
        }
    }

    fun onRetry() {

    }

    fun onLogin() {

    }
}