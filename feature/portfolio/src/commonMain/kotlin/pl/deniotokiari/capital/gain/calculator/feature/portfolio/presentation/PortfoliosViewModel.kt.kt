package pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class PortfoliosViewModel : ViewModel() {
    private val _uiState = MutableStateFlow<PortfoliosUiState>(PortfoliosUiState.Loading)
    val uiState: StateFlow<PortfoliosUiState>
        get() = _uiState

    fun onAction(action: PortfoliosAction) {

    }
}
