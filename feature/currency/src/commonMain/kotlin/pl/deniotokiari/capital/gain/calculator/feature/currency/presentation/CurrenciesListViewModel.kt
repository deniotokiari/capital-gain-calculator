package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.core.misc.AppDispatchers

class CurrenciesListViewModel(
    private val getCurrenciesUseCase: GetCurrenciesUseCase,
    private val appDispatchers: AppDispatchers,
) : ViewModel() {
    private val _uiState = MutableStateFlow<CurrenciesListUiState>(CurrenciesListUiState.Loading)
    val uiState: StateFlow<CurrenciesListUiState>
        get() = _uiState

    init {
        loadCurrencies()
    }

    fun onAction(action: CurrenciesListAction) {
        when (action) {
            is CurrenciesListAction.CurrencyClicked -> onCurrencyClicked(action.currency)
            is CurrenciesListAction.CurrencySearchValueChange -> onCurrencySearchValueChange(action.value)
            CurrenciesListAction.FieldClicked -> onFieldClicked()
            CurrenciesListAction.ItemsBottomSheetDismissed -> onItemsBottomSheetDismissed()
        }
    }

    private fun loadCurrencies() {
        viewModelScope.launch(appDispatchers.default) {
            _uiState.update { CurrenciesListUiState.Loading }

            getCurrenciesUseCase(Unit).fold(
                onSuccess = { result ->
                    _uiState.update {
                        CurrenciesListUiState.Data(
                            currencies = result,
                            currentCurrency = null,
                            itemsBottomSheetState = null,
                        )
                    }
                },
                onError = {
                    _uiState.update { CurrenciesListUiState.Error }
                },
            )
        }
    }

    private fun onCurrencyClicked(currency: Currency) {
        _uiState.update { state ->
            (state as? CurrenciesListUiState.Data)
                ?.copy(
                    currentCurrency = currency,
                    itemsBottomSheetState = null,
                )
                ?: state
        }
    }

    private fun onCurrencySearchValueChange(newValue: String) {
        _uiState.update { state ->
            (state as? CurrenciesListUiState.Data)
                ?.copy(
                    itemsBottomSheetState = state.itemsBottomSheetState
                        ?.copy(
                            searchValue = newValue,
                            currencies = state.currencies.filter { currency ->
                                currency.label.lowercase().contains(newValue.lowercase())
                            },
                        ),
                )
                ?: state
        }
    }

    private fun onItemsBottomSheetDismissed() {
        _uiState.update { state ->
            (state as? CurrenciesListUiState.Data)
                ?.copy(
                    itemsBottomSheetState = null,
                )
                ?: state
        }
    }

    private fun onFieldClicked() {
        when {
            _uiState.value.isError -> loadCurrencies()
            _uiState.value.itemsBottomSheetState == null -> {
                _uiState.update { state ->
                    (state as? CurrenciesListUiState.Data)
                        ?.copy(
                            currencies = state.currencies,
                            currentCurrency = state.currentCurrency,
                            itemsBottomSheetState = ItemsBottomSheetState(
                                currencies = state.currencies,
                                searchValue = "",
                            )
                        )
                        ?: state
                }
            }
        }
    }
}