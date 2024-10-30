package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency

sealed interface CurrenciesListUiState {
    data object Loading : CurrenciesListUiState
    data object Error : CurrenciesListUiState
    data class Data(
        val currencies: List<Currency>,
        val currentCurrency: Currency?,
        val itemsBottomSheetState: ItemsBottomSheetState?,
    ) : CurrenciesListUiState
}

data class ItemsBottomSheetState(
    val searchValue: String = "",
    val currencies: List<Currency>,
)

sealed interface CurrenciesListAction {
    data object FieldClicked : CurrenciesListAction
    data object ItemsBottomSheetDismissed : CurrenciesListAction
    data class CurrencyClicked(val currency: Currency) : CurrenciesListAction
    data class CurrencySearchValueChange(val value: String) : CurrenciesListAction
}

internal val CurrenciesListUiState.itemsBottomSheetState: ItemsBottomSheetState?
    get() = (this as? CurrenciesListUiState.Data)?.itemsBottomSheetState

internal val CurrenciesListUiState.isEnabled: Boolean
    get() = this !is CurrenciesListUiState.Loading

internal val CurrenciesListUiState.isError: Boolean
    get() = this is CurrenciesListUiState.Error

internal val CurrenciesListUiState.isLoading: Boolean
    get() = this is CurrenciesListUiState.Loading

internal val CurrenciesListUiState.currentCurrencyLabel: String
    get() = when (this) {
        is CurrenciesListUiState.Data -> currentCurrency?.label
        CurrenciesListUiState.Error,
        CurrenciesListUiState.Loading -> null
    } ?: ""

internal val CurrenciesListUiState.currencies: List<Currency>
    get() = (this as? CurrenciesListUiState.Data)?.currencies ?: emptyList()

internal val Currency.label: String
    get() = "$code - $name"