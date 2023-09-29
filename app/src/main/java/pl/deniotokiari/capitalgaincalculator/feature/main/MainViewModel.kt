package pl.deniotokiari.capitalgaincalculator.feature.main

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn
import pl.deniotokiari.capitalgaincalculator.usecase.GetAlphaVantageApiBlockingUseCase
import pl.deniotokiari.capitalgaincalculator.usecase.GetProfileCurrencyBlockingUseCase

class MainViewModel(
    getAlphaVantageApiBlockingUseCase: GetAlphaVantageApiBlockingUseCase,
    getProfileCurrencyBlockingUseCase: GetProfileCurrencyBlockingUseCase
) : ViewModel() {

    val uiState: StateFlow<UiState> =
        combine(getAlphaVantageApiBlockingUseCase(Unit), getProfileCurrencyBlockingUseCase(Unit)) { token, currency ->
            if (token != null && currency != null) {
                UiState.Initialized
            } else {
                UiState.RequestInitialization
            }
        }.stateIn(
            scope = viewModelScope,
            started = SharingStarted.Lazily,
            initialValue = UiState.Loading
        )

    sealed class UiState {
        object Loading : UiState()
        object RequestInitialization : UiState()
        object Initialized : UiState()
    }
}