package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.work.WorkManager
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import pl.deniotokiari.capitalgaincalculator.core.fold
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateCurrenciesWorker

class CurrencySelectorViewModel(
    workManager: WorkManager,
    getCurrenciesUseCase: GetCurrenciesUseCase
) : ViewModel() {
    init {
        UpdateCurrenciesWorker.start(workManager)
    }

    private val selectedCurrency: MutableStateFlow<Currency?> = MutableStateFlow(null)
    private val query = MutableStateFlow("")
    val uiState: StateFlow<UiState> = getCurrenciesUseCase(Unit)
        .combine(selectedCurrency) { currencies, currency ->
            currencies to currency
        }
        .map { (result, currency) ->
            result.fold(
                success = { currencies ->
                    UiState(
                        query = "",
                        items = currencies.map { item ->
                            item.toViewModel().copy(selected = item == currency)
                        },
                        error = null,
                        loading = false,
                        enabled = currencies.isNotEmpty()
                    )
                },
                failed = {
                    UiState.error(it.throwable)
                }
            )
        }.combine(query) { state, query ->
            if (query.isNotEmpty()) {
                state.copy(
                    items = state.items.filter { item -> item.title.lowercase().contains(query.lowercase()) }
                )
            } else {
                state
            }
        }
        .stateIn(viewModelScope, SharingStarted.Lazily, UiState.default())

    fun onSelectedCurrencyChange(currency: Currency) {
        selectedCurrency.value = currency
        query.value = ""
    }

    fun onQueryChange(value: String) {
        query.value = value
    }

    data class UiState(
        val query: String,
        val items: List<CurrencyViewModel>,
        val error: Error?,
        val loading: Boolean,
        val enabled: Boolean
    ) {
        data class CurrencyViewModel(
            val title: String,
            val selected: Boolean,
            val currency: Currency
        )

        data class Error(
            val message: String
        )

        companion object {
            fun default(): UiState = UiState(
                query = "",
                items = emptyList(),
                error = null,
                loading = true,
                enabled = false
            )

            fun error(throwable: Throwable): UiState =
                default().copy(error = throwable.message?.let(::Error), loading = false)
        }
    }
}

private fun Currency.toViewModel(): CurrencySelectorViewModel.UiState.CurrencyViewModel =
    CurrencySelectorViewModel.UiState.CurrencyViewModel(
        title = title,
        selected = false,
        currency = this
    )