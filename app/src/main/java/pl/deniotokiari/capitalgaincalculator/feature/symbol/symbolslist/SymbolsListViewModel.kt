package pl.deniotokiari.capitalgaincalculator.feature.symbol.symbolslist

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import pl.deniotokiari.capitalgaincalculator.feature.symbol.Symbol

class SymbolsListViewModel(
    private val portfolioId: String,
    private val getSymbolsByPortfolioIdBlockingUseCase: GetSymbolsByPortfolioIdBlockingUseCase
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        viewModelScope.launch {
            getSymbolsByPortfolioIdBlockingUseCase(portfolioId).collect {
                _uiState.value = _uiState.value.copy(symbols = it)
            }
        }
    }

    data class UiState(
        val symbols: List<Symbol>
    ) {
        companion object {
            fun default() = UiState(
                symbols = emptyList()
            )
        }
    }
}