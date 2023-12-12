package pl.deniotokiari.feature.init_profile

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.domain.model.Currency
import pl.deniotokiari.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.domain.usecase.ScheduleCurrenciesUpdateUseCase

@KoinViewModel
class InitProfileViewModel(
    private val scheduleCurrenciesUpdateUseCase: ScheduleCurrenciesUpdateUseCase,
    private val getCurrenciesUseCase: GetCurrenciesUseCase
) : ViewModel() {
    private val _uiState: MutableStateFlow<UiState> = MutableStateFlow(UiState.Loading)
    val uiState: StateFlow<UiState> = _uiState

    init {
        viewModelScope.launch {
            scheduleCurrenciesUpdateUseCase(Unit)
        }
        viewModelScope.launch {
            getCurrenciesUseCase(Unit).collect { items ->
                _uiState.update {
                    UiState.Idle(
                        currency = null,
                        currencies = items.toViewModelList(),
                        confirmEnabled = false
                    )
                }
            }
        }
    }

    fun onCurrencySelected(index: Int) {

    }

    fun onConfirmClicked() {

    }

    sealed class UiState {
        object Loading : UiState()

        data class Idle(
            val currency: String?,
            val confirmEnabled: Boolean,
            val currencies: List<String>
        ) : UiState()
    }
}

private fun Currency.toViewModel(): String = "$code - ${name ?: "N/A"}"

private fun List<Currency>.toViewModelList(): List<String> = map { it.toViewModel() }