package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.work.WorkManager
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.domain.usecase.GetProfileCurrencyUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.SetProfileCurrencyUseCase
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateCurrenciesWorker

@KoinViewModel
class HomeViewModel(
    getProfileCurrencyUseCase: GetProfileCurrencyUseCase,
    workManager: WorkManager,
    private val setProfileCurrencyUseCase: SetProfileCurrencyUseCase
) : ViewModel() {
    val uiState: StateFlow<UiState> = getProfileCurrencyUseCase(Unit).map { currency ->
        if (currency == null) {
            UpdateCurrenciesWorker.start(workManager)
            UiState.InitProfileCurrency
        } else {
            UiState.Idle(
                profileCurrency = currency
            )
        }
    }.stateIn(viewModelScope, SharingStarted.Lazily, UiState.Loading)

    fun onProfileCurrencySelected(currency: Currency) {
        viewModelScope.launch {
            setProfileCurrencyUseCase(currency)
        }
    }

    sealed class UiState {
        data class Idle(
            val profileCurrency: Currency
        ) : UiState()

        object InitProfileCurrency : UiState()

        object Loading : UiState()
    }
}
