package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow

class CurrenciesListViewModel : ViewModel() {
    private val _events = MutableSharedFlow<CurrenciesListEvent>()
    val events: SharedFlow<CurrenciesListEvent>
        get() = _events

    private val _uiState = MutableStateFlow<CurrenciesListUiState>(CurrenciesListUiState.Loading)
    val uiState: StateFlow<CurrenciesListUiState>
        get() = _uiState

    fun onAction(action: CurrenciesListAction) {

    }
}