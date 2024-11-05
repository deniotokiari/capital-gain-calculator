package pl.deniotokiari.capital.gain.calculator.feature.home.presentation

sealed interface HomeUiState {
    data object Portfolios : HomeUiState
}
