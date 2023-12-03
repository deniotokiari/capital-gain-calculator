package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.model.InstrumentWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.PositionWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddCurrencyToPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddPositionToInstrument
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddTickerToPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetPortfolioInstrumentsWithPositionsUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetPortfolioMarketDataUseCase
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
    private val getPortfolioMarketDataUseCase: GetPortfolioMarketDataUseCase,
    private val addCurrencyToPortfolioUseCase: AddCurrencyToPortfolioUseCase
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
                        instruments = items.toViewModelTicker(_uiState.value.instruments),
                        loading = false,
                        portfolioMarketData = getPortfolioMarketDataUseCase(id)
                    )
                }
            }
        }
    }

    fun onAddCurrencyClicked() {
        viewModelScope.launch {
            val currency = appNavigation.navigateToCurrencySearch()

            if (currency != null) {
                addCurrencyToPortfolioUseCase(
                    AddCurrencyToPortfolioUseCase.Params(
                        currency = currency,
                        portfolioId = id
                    )
                )
            }
        }
    }

    fun onAddTickerClicked() {
        viewModelScope.launch {
            val ticker = appNavigation.navigateToTickerSearch(null)

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

    fun onImportCurrencyFromRevolutClicked() {
        appNavigation.navigateToImportCurrencyFromRevolut(id)
    }

    fun onImportTickerFromRevolutClicked() {
        appNavigation.navigateToImportTickerFromRevolut(id)
    }

    fun onImportFromTrading212Clicked() {
        appNavigation.navigateToImportFromTrading212(id)
    }

    fun onAddPositionClicked(index: Int) {
        viewModelScope.launch {
            val position = appNavigation.navigateToPositionAdd()

            if (position != null) {
                addPositionToInstrument(
                    AddPositionToInstrument.Params(
                        position = position,
                        instrumentId = _uiState.value.instruments[index].instrumentId,
                        portfolioId = id
                    )
                )
            }
        }
    }

    fun onTickerClicked(index: Int) {
        _uiState.update {
            it.copy(instruments = it.instruments.mapIndexed { i, ticker ->
                if (i == index) {
                    ticker.copy(expanded = !ticker.expanded)
                } else {
                    ticker
                }
            })
        }
    }

    data class UiState(
        val instruments: List<Instrument>,
        val portfolioName: String,
        val loading: Boolean,
        val portfolioMarketData: MarketData?
    ) {
        data class Instrument(
            val name: String,
            val instrumentId: String,
            val data: MarketData?,
            val expanded: Boolean,
            val positions: List<Position>
        ) {
            data class Position(
                val count: String,
                val date: String,
                val showSymbol: Boolean,
                val data: MarketData?
            )
        }

        companion object {
            fun default(): UiState = UiState(
                instruments = emptyList(),
                portfolioName = "",
                loading = true,
                portfolioMarketData = null
            )
        }
    }
}

private fun List<InstrumentWithMarketData>.toViewModelTicker(instruments: List<PortfolioViewModel.UiState.Instrument>): List<PortfolioViewModel.UiState.Instrument> =
    map { item ->
        val name = when (item) {
            is InstrumentWithMarketData.CurrencyInstrument -> item.currency.code.value
            is InstrumentWithMarketData.TickerInstrument -> item.ticker.symbol
        }
        val showSymbol = when (item) {
            is InstrumentWithMarketData.CurrencyInstrument -> true
            is InstrumentWithMarketData.TickerInstrument -> false
        }

        PortfolioViewModel.UiState.Instrument(
            name = name,
            data = item.data,
            instrumentId = item.instrumentId,
            expanded = instruments.firstOrNull { ticker -> ticker.instrumentId == item.instrumentId }?.expanded
                ?: false,
            positions = item.positions.toViewModelPosition(showSymbol)
        )
    }

private fun List<PositionWithMarketData>.toViewModelPosition(showSymbol: Boolean): List<PortfolioViewModel.UiState.Instrument.Position> =
    map { item ->
        PortfolioViewModel.UiState.Instrument.Position(
            count = item.position.count.toPlainString(),
            date = dateFormatter.format(item.position.date),
            data = item.data,
            showSymbol = showSymbol
        )
    }