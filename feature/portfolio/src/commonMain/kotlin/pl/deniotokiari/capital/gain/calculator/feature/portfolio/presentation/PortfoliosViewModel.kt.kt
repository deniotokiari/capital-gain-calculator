package pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.usecase.GetProfileCurrencyUseCase
import pl.deniotokiari.core.misc.AppDispatchers

class PortfoliosViewModel(
    private val getProfileCurrencyUseCase: GetProfileCurrencyUseCase,
    private val appDispatchers: AppDispatchers,
) : ViewModel() {
    private val _uiState = MutableStateFlow<PortfoliosUiState>(PortfoliosUiState.Loading)
    val uiState: StateFlow<PortfoliosUiState>
        get() = _uiState

    init {
        viewModelScope.launch(appDispatchers.default) {
            val profileCurrency = getProfileCurrencyUseCase(Unit)
                .getOrNull()

            _uiState.update {
                PortfoliosUiState.Data(
                    profileCurrency = profileCurrency,
                    items = emptyList(),
                )
            }
        }
    }

    fun onAction(action: PortfoliosAction) {
        when (action) {
            PortfoliosAction.AddPortfolio -> onAddPortfolioClicked()
            PortfoliosAction.CreatePortfolioClose -> onCreatePortfolioClosed()
            is PortfoliosAction.PortfolioClick -> {}
            PortfoliosAction.Retry -> {}
            PortfoliosAction.CreatePortfolioClick -> {}
            is PortfoliosAction.PortfolioCurrencyChange -> onPortfolioCurrencyChange(action.currency)
            is PortfoliosAction.PortfolioNameChange -> onPortfolioNameChanged(action.name)
        }
    }

    private fun onPortfolioCurrencyChange(currencyGatewayModel: CurrencyGatewayModel) {
        _uiState.update { state ->
            (state as? PortfoliosUiState.Data)?.copy(
                createPortfolioBottomSheetUiState = state.createPortfolioBottomSheetUiState?.copy(
                    portfolioCurrency = currencyGatewayModel,
                ),
            ) ?: state
        }
    }

    private fun onPortfolioNameChanged(name: String) {
        _uiState.update { state ->
            (state as? PortfoliosUiState.Data)?.copy(
                createPortfolioBottomSheetUiState = state.createPortfolioBottomSheetUiState?.copy(
                    name = name,
                ),
            ) ?: state
        }
    }

    private fun onAddPortfolioClicked() {
        _uiState.update { state ->
            (state as? PortfoliosUiState.Data)?.copy(
                createPortfolioBottomSheetUiState = PortfoliosUiState.CreatePortfolioBottomSheetUiState(
                    portfolioCurrency = state.profileCurrency,
                    name = null,
                ),
            ) ?: state
        }
    }

    private fun onCreatePortfolioClosed() {
        _uiState.update { state ->
            (state as? PortfoliosUiState.Data)?.copy(
                createPortfolioBottomSheetUiState = null,
            ) ?: state
        }
    }
}
