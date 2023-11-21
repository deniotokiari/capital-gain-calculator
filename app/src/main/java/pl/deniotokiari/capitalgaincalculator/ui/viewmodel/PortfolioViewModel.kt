@file:OptIn(ExperimentalCoroutinesApi::class)

package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flatMapConcat
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.PositionWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.TickerWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddPositionToInstrument
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddTickerToPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetAllPortfolioTickersWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetPortfolioNameByIdUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetPositionsWithMarketDataByInstrumentsIdUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class PortfolioViewModel(
    private val id: String,
    private val appNavigation: AppHostNavigation,
    private val addTickerToPortfolioUseCase: AddTickerToPortfolioUseCase,
    private val getAllPortfolioTickersWithMarketData: GetAllPortfolioTickersWithMarketData,
    private val getPortfolioNameByIdUseCase: GetPortfolioNameByIdUseCase,
    private val addPositionToInstrument: AddPositionToInstrument,
    private val getPositionsWithMarketDataByInstrumentsIdUseCase: GetPositionsWithMarketDataByInstrumentsIdUseCase
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        viewModelScope.launch {
            _uiState.update {
                it.copy(portfolioName = getPortfolioNameByIdUseCase(id))
            }
        }

        viewModelScope.launch {
            getAllPortfolioTickersWithMarketData(id)
                .flatMapConcat { tickers ->
                    getPositionsWithMarketDataByInstrumentsIdUseCase(tickers.map { item -> item.ticker.symbol })
                        .map { positions ->
                            tickers to positions
                        }
                }
                .collect { (tickers, positions) ->
                    _uiState.update {
                        it.copy(
                            tickers = tickers.toViewModel(_uiState.value.tickers),
                            positions = positions,
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

    fun onAddPositionClicked(index: Int) {
        viewModelScope.launch {
            val position = appNavigation.navigateToPositionAdd()

            if (position != null) {
                addPositionToInstrument(
                    AddPositionToInstrument.Params(
                        instrumentId = uiState.value.tickers[index].instrumentId,
                        position = position
                    )
                )
            }
        }
    }

    fun onTickerClicked(index: Int) {
        _uiState.update {
            it.copy(tickers = it.tickers.mapIndexed { i, ticker ->
                if (i == index) {
                    ticker.copy(expanded = !ticker.expanded)
                } else {
                    ticker
                }
            })
        }
    }

    data class UiState(
        val tickers: List<Ticker>,
        val positions: Map<String, List<PositionWithMarketData>>,
        val portfolioName: String,
        val loading: Boolean
    ) {
        data class Ticker(
            val name: String,
            val data: MarketData?,
            val expanded: Boolean,
            val instrumentId: String
        )

        companion object {
            fun default(): UiState = UiState(
                tickers = emptyList(),
                portfolioName = "",
                loading = true,
                positions = emptyMap()
            )
        }
    }
}

private fun List<TickerWithMarketData>.toViewModel(items: List<PortfolioViewModel.UiState.Ticker>): List<PortfolioViewModel.UiState.Ticker> =
    map { item ->
        PortfolioViewModel.UiState.Ticker(
            name = item.ticker.symbol,
            data = item.data,
            expanded = items.firstOrNull { ticker -> ticker.instrumentId == item.ticker.symbol }?.expanded ?: false,
            instrumentId = item.ticker.symbol
        )
    }