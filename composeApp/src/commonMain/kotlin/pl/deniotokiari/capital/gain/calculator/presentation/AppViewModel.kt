package pl.deniotokiari.capital.gain.calculator.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.distinctUntilChanged
import kotlinx.coroutines.launch
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.IsAuthRequiredFlowUseCase
import pl.deniotokiari.core.misc.AppDispatchers

class AppViewModel(
    private val isAuthRequiredFlowUseCase: IsAuthRequiredFlowUseCase,
    appDispatchers: AppDispatchers,
) : ViewModel() {
    private val _uiEvent = MutableSharedFlow<AppUiAction>()
    val event: SharedFlow<AppUiAction> get() = _uiEvent

    init {
        viewModelScope.launch(appDispatchers.default) {
            delay(300L)

            isAuthRequiredFlowUseCase(Unit).distinctUntilChanged().collect { isAuthRequired ->
                if (isAuthRequired) {
                    _uiEvent.emit(AppUiAction.AuthRequired)
                } else {
                    _uiEvent.emit(AppUiAction.NavigateToHome)
                }
            }
        }
    }
}
