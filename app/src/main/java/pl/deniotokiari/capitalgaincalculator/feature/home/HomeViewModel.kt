package pl.deniotokiari.capitalgaincalculator.feature.home

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.Portfolio
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.toDbPortfolio
import pl.deniotokiari.capitalgaincalculator.usecase.AddPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.usecase.DeletePortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.usecase.GetPortfoliosBlockingUseCase

class HomeViewModel(
    getPortfoliosBlockingUseCase: GetPortfoliosBlockingUseCase,
    private val addPortfolioUseCase: AddPortfolioUseCase,
    private val deletePortfolioUseCase: DeletePortfolioUseCase
) : ViewModel() {
    val uiState: StateFlow<UiState> = combine(
        getPortfoliosBlockingUseCase(Unit)
    ) { portfolios ->
        UiState(
            portfolios = portfolios[0]
        )
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.Lazily,
        initialValue = UiState.default()
    )

    fun onAddPortfolio(portfolio: Portfolio) {
        viewModelScope.launch {
            addPortfolioUseCase(portfolio)
        }
    }

    fun onDeletePortfolio(portfolio: Portfolio) {
        viewModelScope.launch {
            deletePortfolioUseCase(portfolio.toDbPortfolio().id)
        }
    }

    data class UiState(
        val portfolios: List<Portfolio>
    ) {
        companion object {
            fun default() = UiState(
                portfolios = emptyList()
            )
        }
    }
}