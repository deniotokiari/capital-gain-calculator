package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency

sealed interface CurrenciesListUiState {
    data object Loading : CurrenciesListUiState
    data object Error : CurrenciesListUiState
    data class Data(
        val currencies: List<Currency>,
        val currentCurrency: Currency?,
        val showItems: Boolean,
    ) : CurrenciesListUiState
}

sealed interface CurrenciesListAction {
    data object FieldClicked : CurrenciesListAction
}

sealed interface CurrenciesListEvent {

}

internal val CurrenciesListUiState.isEnabled: Boolean
    get() = this !is CurrenciesListUiState.Loading

internal val CurrenciesListUiState.isError: Boolean
    get() = this is CurrenciesListUiState.Error

internal val CurrenciesListUiState.isLoading: Boolean
    get() = this is CurrenciesListUiState.Loading

internal val CurrenciesListUiState.currentCurrency: String
    get() = when (this) {
        is CurrenciesListUiState.Data -> currentCurrency?.let { currency -> "${currency.code} - ${currency.name}" }
        CurrenciesListUiState.Error,
        CurrenciesListUiState.Loading -> null
    } ?: ""

internal val CurrenciesListUiState.showItems: Boolean
    get() = this is CurrenciesListUiState.Data && showItems