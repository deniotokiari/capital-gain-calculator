package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.work.WorkManager
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.domain.usecase.IsProfileHasCurrencyUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.SetProfileCurrencyUseCase
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateCurrenciesWorker

@KoinViewModel
class InitProfileCurrencyViewModel(
    private val isProfileHasCurrencyUseCase: IsProfileHasCurrencyUseCase,
    private val setProfileCurrencyUseCase: SetProfileCurrencyUseCase,
    workManager: WorkManager
) : ViewModel() {
    private val currency: MutableStateFlow<Currency?> = MutableStateFlow(null)
    private val _uiState: MutableStateFlow<UiState> = MutableStateFlow(UiState.Loading)
    val uiState: StateFlow<UiState> = _uiState.combine(currency) { state, currency ->
        when (state) {
            is UiState.Idle -> state.copy(currency = currency, confirmEnabled = currency != null)
            else -> state
        }
    }.stateIn(viewModelScope, SharingStarted.Lazily, UiState.Loading)

    init {
        viewModelScope.launch {
            if (isProfileHasCurrencyUseCase(Unit)) {
                _uiState.value = UiState.Initialized
            } else {
                UpdateCurrenciesWorker.start(workManager)

                _uiState.value = UiState.Idle(
                    currency = null,
                    confirmEnabled = false
                )
            }
        }
    }

    fun onCurrencySelected(currency: Currency) {
        this.currency.value = currency
    }

    fun onConfirmCurrency() {
        viewModelScope.launch {
            currency.value?.let {
                setProfileCurrencyUseCase(it)

                _uiState.value = UiState.Initialized
            }
        }
    }

    sealed class UiState {
        object Loading : UiState()

        data class Idle(
            val currency: Currency?,
            val confirmEnabled: Boolean
        ) : UiState()

        object Initialized : UiState()
    }
}