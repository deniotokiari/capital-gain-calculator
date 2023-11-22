package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.PositionWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.TickerWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddPositionToInstrument
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddTickerToPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.CalculateMarketDataFromMarketDataList
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetPortfolioInstrumentsWithPositionsUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetPortfolioNameByIdUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation
import java.time.format.DateTimeFormatter

private val dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")

@KoinViewModel
class PortfolioViewModel(
    private val id: String,
    private val appNavigation: AppHostNavigation,
    private val addTickerToPortfolioUseCase: AddTickerToPortfolioUseCase,
    private val getPortfolioNameByIdUseCase: GetPortfolioNameByIdUseCase,
    private val addPositionToInstrument: AddPositionToInstrument,
    private val getPortfolioInstrumentsWithPositionsUseCase: GetPortfolioInstrumentsWithPositionsUseCase,
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList
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
            getPortfolioInstrumentsWithPositionsUseCase(id).collect { items ->
                _uiState.update {
                    it.copy(
                        tickers = items.toViewModelTicker(_uiState.value.tickers),
                        loading = false,
                        portfolioMarketData = calculateMarketDataFromMarketDataList(
                            items.mapNotNull { item -> item.data }
                        )
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
                        position = position,
                        instrumentId = _uiState.value.tickers[index].instrumentId,
                        portfolioId = id
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
        val portfolioName: String,
        val loading: Boolean,
        val portfolioMarketData: MarketData?
    ) {
        data class Ticker(
            val name: String,
            val instrumentId: String,
            val data: MarketData?,
            val expanded: Boolean,
            val positions: List<Position>
        ) {
            data class Position(
                val count: String,
                val date: String,
                val data: MarketData?
            )
        }

        companion object {
            fun default(): UiState = UiState(
                tickers = emptyList(),
                portfolioName = "",
                loading = true,
                portfolioMarketData = null
            )
        }
    }
}

private fun List<TickerWithMarketData>.toViewModelTicker(tickers: List<PortfolioViewModel.UiState.Ticker>): List<PortfolioViewModel.UiState.Ticker> =
    map { item ->
        PortfolioViewModel.UiState.Ticker(
            name = item.ticker.symbol,
            data = item.data,
            instrumentId = item.instrumentId,
            expanded = tickers.firstOrNull { ticker -> ticker.instrumentId == item.instrumentId }?.expanded ?: false,
            positions = item.positions.toViewModelPosition()
        )
    }

private fun List<PositionWithMarketData>.toViewModelPosition(): List<PortfolioViewModel.UiState.Ticker.Position> =
    map { item ->
        PortfolioViewModel.UiState.Ticker.Position(
            count = item.position.count.toPlainString(),
            date = dateFormatter.format(item.position.date),
            data = item.data
        )
    }