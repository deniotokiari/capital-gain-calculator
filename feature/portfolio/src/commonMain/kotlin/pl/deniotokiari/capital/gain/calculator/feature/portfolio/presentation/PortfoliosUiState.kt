package pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation

import pl.deniotokiari.capital.gain.calculator.feature.portfolio.data.Portfolio

sealed interface PortfoliosUiState {
    data object Loading : PortfoliosUiState
    data object Error : PortfoliosUiState
    data class Data(
        val items: List<Portfolio>,
    ) : PortfoliosUiState
}

sealed interface PortfoliosAction {
    data object Retry : PortfoliosAction
}
