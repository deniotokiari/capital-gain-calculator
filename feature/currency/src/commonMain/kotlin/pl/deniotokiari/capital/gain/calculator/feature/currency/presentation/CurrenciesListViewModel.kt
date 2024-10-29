package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class CurrenciesListViewModel : ViewModel() {
    private val _uiState = MutableStateFlow<CurrenciesListUiState>(CurrenciesListUiState.Loading)
    val uiState: StateFlow<CurrenciesListUiState>
        get() = _uiState
}