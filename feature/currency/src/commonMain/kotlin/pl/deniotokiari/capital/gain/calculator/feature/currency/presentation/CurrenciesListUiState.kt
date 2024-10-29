package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency

sealed interface CurrenciesListUiState {
    data object Loading : CurrenciesListUiState
    data object Error : CurrenciesListUiState
    data class Data(
        val currencies: List<Currency>,
        val currentCurrency: Currency?,
    ) : CurrenciesListUiState
}

internal val CurrenciesListUiState.isEnabled: Boolean
    get() = this !is CurrenciesListUiState.Loading

internal val CurrenciesListUiState.isError: Boolean
    get() = this is CurrenciesListUiState.Error

internal val CurrenciesListUiState.isLoading: Boolean
    get() = this is CurrenciesListUiState.Loading