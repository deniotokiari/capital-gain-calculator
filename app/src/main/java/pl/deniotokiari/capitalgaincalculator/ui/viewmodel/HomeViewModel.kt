package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetAllPortfoliosWithMarketDataUseCase

@KoinViewModel
class HomeViewModel(
    getAllPortfoliosWithMarketDataUseCase: GetAllPortfoliosWithMarketDataUseCase
) : ViewModel() {
    val uiState: StateFlow<UiState> = getAllPortfoliosWithMarketDataUseCase(Unit).map {
        UiState(
            portfolios = it.toViewModelList(),
            loading = false
        )
    }.stateIn(viewModelScope, SharingStarted.Lazily, UiState.default())

    data class UiState(
        val portfolios: List<PortfolioViewModel>,
        val loading: Boolean
    ) {
        data class PortfolioViewModel(
            val name: String,
            val data: MarketData
        )

        companion object {
            fun default(): UiState = UiState(
                portfolios = emptyList(),
                loading = true
            )
        }
    }
}

private fun List<PortfolioWithMarketData>.toViewModelList(): List<HomeViewModel.UiState.PortfolioViewModel> =
    map { it.toViewModel() }

private fun PortfolioWithMarketData.toViewModel(): HomeViewModel.UiState.PortfolioViewModel =
    HomeViewModel.UiState.PortfolioViewModel(
        name = name,
        data = data
    )