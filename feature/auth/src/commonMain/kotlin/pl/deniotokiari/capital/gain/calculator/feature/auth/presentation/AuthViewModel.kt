package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.GetUserIdUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.IsAuthRequiredUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.LoginUserWithEmailAndPasswordUseCase
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.SignupUserWithEmailAndPasswordUseCase
import pl.deniotokiari.capital.gain.calculator.gateway.domain.usecase.GetUsdCurrencyUseCase
import pl.deniotokiari.capital.gain.calculator.gateway.domain.usecase.SaveSettingsUseCase
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.GatewayCurrency
import pl.deniotokiari.core.misc.AppDispatchers
import pl.deniotokiari.core.misc.mapError
import pl.deniotokiari.core.navigation.route.AuthType

class AuthViewModel(
    private val type: AuthType,
    private val isAuthRequiredUseCase: IsAuthRequiredUseCase,
    private val signupUserWithEmailAndPasswordUseCase: SignupUserWithEmailAndPasswordUseCase,
    private val loginUserWithEmailAndPasswordUseCase: LoginUserWithEmailAndPasswordUseCase,
    private val getUserIdUseCase: GetUserIdUseCase,
    private val getUsdCurrencyUseCase: GetUsdCurrencyUseCase,
    private val saveSettingsUseCase: SaveSettingsUseCase,
    private val appDispatchers: AppDispatchers,
) : ViewModel() {
    private val _event = MutableSharedFlow<AuthUiEvent>()
    val event: SharedFlow<AuthUiEvent> get() = _event

    private val _uiState = MutableStateFlow(AuthUiState(type = AuthUiType.Loading))
    val uiState: StateFlow<AuthUiState> get() = _uiState

    init {
        viewModelScope.launch(appDispatchers.default) {
            if (isAuthRequiredUseCase(Unit)) {
                _uiState.update { state ->
                    state.copy(
                        type = type.toUiType,
                        currency = getUsdCurrencyUseCase(Unit),
                    )
                }
            }
        }
    }

    fun onAction(action: AuthUiAction) {
        when (action) {
            is AuthUiAction.EmailChanged -> onEmailChange(action.value)
            is AuthUiAction.PasswordChanged -> onPasswordChange(action.value)
            is AuthUiAction.CurrencyChanged -> onCurrencyChange(action.currency)
            AuthUiAction.Login -> onLogin()
            AuthUiAction.Signup -> onSignup()
            AuthUiAction.NavigateToLogin -> onNavigateToLogin()
            AuthUiAction.Retry -> onRetry()
            AuthUiAction.RetryCancel -> onRetryCancel()
        }
    }

    private fun onCurrencyChange(currency: GatewayCurrency) {
        _uiState.update { state -> state.copy(currency = currency) }
    }

    private fun onRetryCancel() {
        _uiState.update { state ->
            state.copy(
                email = state.email.copy(enabled = true),
                password = state.password.copy(enabled = true),
            )
        }
    }

    private fun onEmailChange(email: String) {
        _uiState.update { state -> state.copy(email = state.email.copy(value = email)) }
    }

    private fun onPasswordChange(password: String) {
        _uiState.update { state -> state.copy(password = state.password.copy(value = password)) }
    }

    private fun onRetry() {
        when (_uiState.value.type) {
            AuthUiType.Login -> onLogin()
            AuthUiType.Signup -> onSignup()
            else -> Unit
        }
    }

    private fun onLogin() {
        viewModelScope.launch(appDispatchers.default) {
            _uiState.update { state ->
                state.copy(
                    email = state.email.copy(enabled = false),
                    password = state.password.copy(enabled = false),
                )
            }

            loginUserWithEmailAndPasswordUseCase(
                LoginUserWithEmailAndPasswordUseCase.Params(
                    email = _uiState.value.email.value,
                    password = _uiState.value.password.value,
                )
            ).fold(
                onSuccess = { handleSuccess() },
                onError = { error -> handleError(error) },
            )
        }
    }

    private fun handleSuccess() {
        _uiState.update { state ->
            state.copy(
                email = state.email.copy(enabled = true, error = true),
                password = state.password.copy(enabled = true, error = true),
            )
        }
    }

    private suspend fun handleError(error: AuthError) {
        when (error) {
            AuthError.GenericError -> _event.emit(AuthUiEvent.Error)
            AuthError.InvalidCredentials -> _uiState.update { state ->
                state.copy(
                    email = state.email.copy(enabled = true, error = true),
                    password = state.password.copy(enabled = true, error = true),
                )
            }
        }
    }

    private fun onSignup() {
        viewModelScope.launch(appDispatchers.default) {
            _uiState.update { state ->
                state.copy(
                    email = state.email.copy(enabled = false),
                    password = state.password.copy(enabled = false),
                )
            }

            signupUserWithEmailAndPasswordUseCase(
                SignupUserWithEmailAndPasswordUseCase.Params(
                    email = _uiState.value.email.value,
                    password = _uiState.value.password.value,
                )
            )
                .then { getUserIdUseCase(Unit) }
                .then { userId ->
                    saveSettingsUseCase(
                        SaveSettingsUseCase.Params(
                            userId = userId,
                            currency = _uiState.value.currency,
                        )
                    ).mapError { AuthError.GenericError }
                }
                .fold(
                    onSuccess = { handleSuccess() },
                    onError = { error -> handleError(error) },
                )
        }
    }

    private fun onNavigateToLogin() {
        viewModelScope.launch(appDispatchers.default) {
            _event.emit(AuthUiEvent.NavigateToLogin)
        }
    }
}