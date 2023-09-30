package pl.deniotokiari.capitalgaincalculator.feature.symbol.symbolslist

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import pl.deniotokiari.capitalgaincalculator.feature.instrument.usecase.GetInstrumentIdBySymbolIdAndPortfolioIdUseCase
import pl.deniotokiari.capitalgaincalculator.feature.position.Position
import pl.deniotokiari.capitalgaincalculator.feature.position.usecase.AddPositionToInstrumentUseCase
import pl.deniotokiari.capitalgaincalculator.feature.symbol.Symbol
import pl.deniotokiari.capitalgaincalculator.feature.symbol.toDbSymbol

class SymbolsListViewModel(
    private val portfolioId: String,
    private val getSymbolsByPortfolioIdBlockingUseCase: GetSymbolsByPortfolioIdBlockingUseCase,
    private val addPositionToInstrumentUseCase: AddPositionToInstrumentUseCase,
    private val getInstrumentIdBySymbolIdAndPortfolioIdUseCase: GetInstrumentIdBySymbolIdAndPortfolioIdUseCase
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

    fun addPosition(symbol: Symbol, position: Position) {
        viewModelScope.launch {
            addPositionToInstrumentUseCase(
                AddPositionToInstrumentUseCase.Params(
                    position = position,
                    instrumentId = getInstrumentIdBySymbolIdAndPortfolioIdUseCase(
                        GetInstrumentIdBySymbolIdAndPortfolioIdUseCase.Params(
                            symbolId = symbol.toDbSymbol().id,
                            portfolioId = portfolioId
                        )
                    )
                )
            )
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