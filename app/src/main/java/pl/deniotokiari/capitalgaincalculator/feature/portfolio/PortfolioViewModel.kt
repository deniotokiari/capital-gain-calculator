package pl.deniotokiari.capitalgaincalculator.feature.portfolio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase.AddSymbolToPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase.GetPortfolioByIdUseCase
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.usecase.GetPortfolioSymbolsBlockingUseCase
import pl.deniotokiari.capitalgaincalculator.feature.position.Position
import pl.deniotokiari.capitalgaincalculator.feature.symbol.Symbol

class PortfolioViewModel(
    private val portfolioId: String,
    private val addSymbolToPortfolioUseCase: AddSymbolToPortfolioUseCase,
    private val getPortfolioSymbolsBlockingUseCase: GetPortfolioSymbolsBlockingUseCase,
    private val getPortfolioByIdUseCase: GetPortfolioByIdUseCase
) : ViewModel() {

    private lateinit var portfolio: Portfolio
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        viewModelScope.launch {
            portfolio = getPortfolioByIdUseCase(portfolioId)

            _uiState.value = _uiState.value.copy(portfolioName = portfolio.name)
        }
        viewModelScope.launch {
            getPortfolioSymbolsBlockingUseCase(portfolioId).collect {
                _uiState.value = _uiState.value.copy(symbols = it)
            }
        }
    }

    fun addSymbol(symbol: Symbol) {
        viewModelScope.launch {
            addSymbolToPortfolioUseCase(
                AddSymbolToPortfolioUseCase.Params(
                    symbol = symbol,
                    portfolio = portfolio
                )
            )
        }
    }

    fun addPosition(symbol: Symbol, position: Position) {

    }

    data class UiState(
        val portfolioName: String,
        val symbols: List<Symbol>
    ) {
        companion object {
            fun default() = UiState(
                portfolioName = "",
                symbols = emptyList()
            )
        }
    }
}