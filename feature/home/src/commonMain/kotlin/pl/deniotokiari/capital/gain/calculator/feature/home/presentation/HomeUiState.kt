package pl.deniotokiari.capital.gain.calculator.feature.home.presentation

sealed interface HomeUiState {
    data object Loading : HomeUiState
    data class Portfolios(
        val items: List<Portfolio>,
    ) : HomeUiState
}

data class Portfolio(
    val title: String,
)
