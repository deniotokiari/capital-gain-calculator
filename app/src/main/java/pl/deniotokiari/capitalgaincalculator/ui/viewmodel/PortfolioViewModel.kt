package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.TickerWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddTickerToPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetAllPortfolioTickersWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetPortfolioNameByIdUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class PortfolioViewModel(
    private val id: String,
    private val appNavigation: AppHostNavigation,
    private val addTickerToPortfolioUseCase: AddTickerToPortfolioUseCase,
    private val getAllPortfolioTickersWithMarketData: GetAllPortfolioTickersWithMarketData,
    private val getPortfolioNameByIdUseCase: GetPortfolioNameByIdUseCase
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        viewModelScope.launch {
            _uiState.update {
                it.copy(portfolioName = getPortfolioNameByIdUseCase(id))
            }

            getAllPortfolioTickersWithMarketData(id).collect { items ->
                _uiState.update {
                    it.copy(
                        tickers = items.toViewModel(),
                        loading = false
                    )
                }
            }
        }
    }

    fun onAddTickerCLicked() {
        viewModelScope.launch {
            val ticker = appNavigation.navigateToTickerSearch()

            if (ticker != null) {
                addTickerToPortfolioUseCase(
                    AddTickerToPortfolioUseCase.Params(
                        ticker = ticker,
                        portfolioId = id
                    )
                )
            }
        }
    }

    data class UiState(
        val tickers: List<Ticker>,
        val portfolioName: String,
        val loading: Boolean
    ) {
        data class Ticker(
            val name: String,
            val data: MarketData?
        )

        companion object {
            fun default(): UiState = UiState(
                tickers = emptyList(),
                portfolioName = "",
                loading = true
            )
        }
    }
}

private fun List<TickerWithMarketData>.toViewModel(): List<PortfolioViewModel.UiState.Ticker> = map { item ->
    PortfolioViewModel.UiState.Ticker(
        name = item.ticker.symbol,
        data = item.data
    )
}