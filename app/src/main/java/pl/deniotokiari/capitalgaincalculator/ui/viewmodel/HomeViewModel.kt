@file:OptIn(ExperimentalCoroutinesApi::class)

package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.work.WorkManager
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetAllPortfoliosUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetProfileCurrencyUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.SetProfileCurrencyUseCase
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateCurrenciesWorker

@KoinViewModel
class HomeViewModel(
    getProfileCurrencyUseCase: GetProfileCurrencyUseCase,
    getAllPortfoliosUseCase: GetAllPortfoliosUseCase,
    workManager: WorkManager,
    private val setProfileCurrencyUseCase: SetProfileCurrencyUseCase
) : ViewModel() {
    val uiState: StateFlow<UiState> = getProfileCurrencyUseCase(Unit).map { currency ->
        if (currency == null) {
            UpdateCurrenciesWorker.start(workManager)

            UiState.InitProfileCurrency
        } else {
            UiState.Idle(portfolios = emptyList(), loading = true)
        }
    }.combine(getAllPortfoliosUseCase(Unit)) { state, portfolios ->
        when (state) {
            is UiState.Idle -> state.copy(portfolios = portfolios.toViewModelList(), loading = false)
            else -> state
        }
    }.stateIn(viewModelScope, SharingStarted.Lazily, UiState.Loading)

    fun onProfileCurrencySelected(currency: Currency) {
        viewModelScope.launch {
            setProfileCurrencyUseCase(currency)
        }
    }

    sealed class UiState() {
        data class Idle(
            val portfolios: List<PortfolioViewModel>,
            val loading: Boolean
        ) : UiState()

        object Loading : UiState()
        object InitProfileCurrency : UiState()

        data class PortfolioViewModel(
            val title: String
        )
    }
}

private fun List<PortfolioWithMarketData>.toViewModelList(): List<HomeViewModel.UiState.PortfolioViewModel> =
    map { it.toViewModel() }

private fun PortfolioWithMarketData.toViewModel(): HomeViewModel.UiState.PortfolioViewModel =
    HomeViewModel.UiState.PortfolioViewModel(
        title = title
    )