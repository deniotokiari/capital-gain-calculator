package pl.deniotokiari.feature.add_portfolio.viewmodel

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.launchInDefault
import pl.deniotokiari.domain.model.toViewModelList
import pl.deniotokiari.domain.usecase.currency.GetCurrenciesUseCase

@Factory(binds = [AddPortfolioViewModel::class])
class AddPortfolioViewModel(
    private val getCurrenciesUseCase: GetCurrenciesUseCase
) : ViewModel() {
    private val _uiState: MutableStateFlow<UiState> = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        launchInDefault {
            getCurrenciesUseCase(Unit).collect { items ->
                _uiState.update { it.copy(currencies = items.toViewModelList()) }
            }
        }
    }

    fun onNameChanged(name: String) {
        _uiState.update { it.copy(name = name) }
    }

    fun onCurrencySelected(index: Int) {
        _uiState.update { it.copy(selectedCurrencyIndex = index) }
    }

    data class UiState(
        val name: String?,
        val currencies: List<String>,
        val selectedCurrencyIndex: Int?,
        val currencySelectorTitle: String,
        val currencySelectorLabel: String
    ) {
        val confirmEnabled: Boolean get() = !name.isNullOrEmpty() && selectedCurrencyIndex != null

        companion object {
            fun default() = UiState(
                name = null,
                currencies = emptyList(),
                selectedCurrencyIndex = null,
                currencySelectorTitle = "Portfolio currency",
                currencySelectorLabel = "Search for currency"
            )
        }
    }
}