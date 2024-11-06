package pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation

import pl.deniotokiari.capital.gain.calculator.feature.portfolio.data.Portfolio
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel

sealed interface PortfoliosUiState {
    data object Loading : PortfoliosUiState
    data object Error : PortfoliosUiState
    data class Data(
        val profileCurrency: CurrencyGatewayModel?,
        val items: List<Portfolio>,
        val createPortfolioBottomSheetUiState: CreatePortfolioBottomSheetUiState? = null,
    ) : PortfoliosUiState

    data class CreatePortfolioBottomSheetUiState(
        val portfolioCurrency: CurrencyGatewayModel?,
        val name: String? = null,
    )
}

sealed interface PortfoliosAction {
    data object Retry : PortfoliosAction
    data object AddPortfolio : PortfoliosAction
    data object CreatePortfolioClose : PortfoliosAction
    data object CreatePortfolioClick : PortfoliosAction
    data class PortfolioClick(val portfolio: Portfolio) : PortfoliosAction
    data class PortfolioNameChange(val name: String) : PortfoliosAction
    data class PortfolioCurrencyChange(val currency: CurrencyGatewayModel) : PortfoliosAction
}
