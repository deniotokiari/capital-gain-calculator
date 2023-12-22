package pl.deniotokiari.feature.add_portfolio.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.launchInDefault
import pl.deniotokiari.domain.model.Currency
import pl.deniotokiari.domain.usecase.currency.GetCurrenciesUseCase
import pl.deniotokiari.domain.usecase.portfolio.AddPortfolioUseCase
import pl.deniotokiari.navigation.AppNavigation

@Factory(binds = [AddPortfolioViewModel::class])
class AddPortfolioViewModel(
    private val getCurrenciesUseCase: GetCurrenciesUseCase,
    private val addPortfolioUseCase: AddPortfolioUseCase,
    private val appNavigation: AppNavigation
) : ViewModel() {
    private val _uiState: MutableStateFlow<UiState> = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        launchInDefault {
            getCurrenciesUseCase(Unit).collect { items ->
                _uiState.update {
                    it.copy(
                        currencies = items.toViewModelList()
                    )
                }
            }
        }
    }

    fun onNameChanged(name: String) {
        _uiState.update { it.copy(name = name) }
    }

    fun onCurrencySelected(index: Int) {
        _uiState.update { it.copy(selectedCurrencyIndex = index) }
    }

    fun onConfirmClicked() {
        launchInDefault {
            addPortfolioUseCase(
                AddPortfolioUseCase.Params(
                    name = _uiState.value.name,
                    currencyCode = _uiState.value.currencies[requireNotNull(_uiState.value.selectedCurrencyIndex)].code
                )
            )

            viewModelScope.launch {
                appNavigation.popBackStack()
            }
        }
    }

    data class UiState(
        val name: String,
        val currencies: List<Currency>,
        val selectedCurrencyIndex: Int?,
        val currencySelectorTitle: String,
        val currencySelectorLabel: String
    ) {
        val confirmEnabled: Boolean get() = name.isNotEmpty() && selectedCurrencyIndex != null

        val currenciesSelectorItems: List<String> = currencies.map { "${it.code} - ${it.name}" }

        data class Currency(
            val name: String,
            val code: String
        )

        companion object {
            fun default() = UiState(
                name = "",
                currencies = emptyList(),
                selectedCurrencyIndex = null,
                currencySelectorTitle = "Portfolio currency",
                currencySelectorLabel = "Search for currency"
            )
        }
    }
}

private fun Currency.toViewModel() = AddPortfolioViewModel.UiState.Currency(
    name = name ?: code,
    code = code
)

private fun List<Currency>.toViewModelList() = map { it.toViewModel() }