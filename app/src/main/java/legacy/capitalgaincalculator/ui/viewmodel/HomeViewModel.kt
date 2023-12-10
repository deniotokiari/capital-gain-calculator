package legacy.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.work.WorkManager
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import legacy.capitalgaincalculator.domain.model.MarketData
import legacy.capitalgaincalculator.domain.usecase.DeletePortfolioUseCase
import legacy.capitalgaincalculator.domain.usecase.GetAllPortfoliosWithMarketDataUseCase
import legacy.capitalgaincalculator.domain.usecase.GetProfileMarketDataUseCase
import legacy.capitalgaincalculator.ui.navigation.AppHostNavigation
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.DeletePortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetAllPortfoliosWithMarketDataUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetProfileMarketDataUseCase
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateConversionRatesWorker
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateTickersPriceWorker
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class HomeViewModel(
    private val appNavigation: AppHostNavigation,
    getAllPortfoliosWithMarketDataUseCase: GetAllPortfoliosWithMarketDataUseCase,
    getProfileMarketDataUseCase: GetProfileMarketDataUseCase,
    private val deletePortfolioUseCase: DeletePortfolioUseCase,
    workManager: WorkManager
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        UpdateConversionRatesWorker.start(workManager)
        UpdateTickersPriceWorker.start(workManager)

        viewModelScope.launch {
            getAllPortfoliosWithMarketDataUseCase(Unit).collect { items ->
                _uiState.update {
                    it.copy(
                        loading = false,
                        portfolios = items.map { item -> item.toViewModel() }
                    )
                }
            }
        }
        viewModelScope.launch {
            getProfileMarketDataUseCase(Unit).collect { data ->
                _uiState.update {
                    it.copy(
                        marketDataForAllPortfolios = data
                    )
                }
            }
        }
    }

    fun onPortfolioClicked(index: Int) {
        uiState.value.portfolios.getOrNull(index)?.let {
            appNavigation.navigateToPortfolio(it.id)
        }
    }

    fun onAddPortfolioClicked() {
        appNavigation.navigateToPortfolioAdd()
    }

    fun onDeletePortfolio(name: String) {
        viewModelScope.launch {
            deletePortfolioUseCase(name)
        }
    }

    data class UiState(
        val portfolios: List<PortfolioViewModel>,
        val marketDataForAllPortfolios: MarketData?,
        val loading: Boolean
    ) {
        data class PortfolioViewModel(
            val name: String,
            val data: MarketData?,
            internal val id: String
        )

        companion object {
            fun default(): UiState = UiState(
                portfolios = emptyList(),
                marketDataForAllPortfolios = null,
                loading = true
            )
        }
    }
}

private fun PortfolioWithMarketData.toViewModel(): HomeViewModel.UiState.PortfolioViewModel =
    HomeViewModel.UiState.PortfolioViewModel(
        name = name,
        data = data,
        id = name
    )