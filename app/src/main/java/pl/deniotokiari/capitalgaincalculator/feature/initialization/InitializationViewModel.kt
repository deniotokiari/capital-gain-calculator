package pl.deniotokiari.capitalgaincalculator.feature.initialization

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.usecase.SetAlphaVantageApiKeyUseCase
import pl.deniotokiari.capitalgaincalculator.usecase.SetProfileCurrencyUseCase

class InitializationViewModel(
    private val setAlphaVantageApiKeyUseCase: SetAlphaVantageApiKeyUseCase,
    private val setProfileCurrencyUseCase: SetProfileCurrencyUseCase
) : ViewModel() {

    private val _uiState: MutableStateFlow<UiState> = MutableStateFlow(
        UiState(
            selectedCurrency = null,
            alphaVantageApiKey = "",
            isDoneEnabled = false,
            isError = false
        )
    )
    val uiState: StateFlow<UiState> = _uiState

    fun onProfileCurrencySelected(currency: Currency) {
        _uiState.value = _uiState.value.copy(
            selectedCurrency = currency,
            isDoneEnabled = isDoneEnabled(_uiState.value.alphaVantageApiKey, currency),
            isError = isError(_uiState.value.alphaVantageApiKey)
        )
    }

    fun onAlphaVantageApiKeyUpdated(key: String) {
        _uiState.value = _uiState.value.copy(
            alphaVantageApiKey = key,
            isDoneEnabled = isDoneEnabled(key, _uiState.value.selectedCurrency),
            isError = isError(key)
        )
    }

    fun onDoneClicked() {
        viewModelScope.launch {
            setAlphaVantageApiKeyUseCase(_uiState.value.alphaVantageApiKey)
            _uiState.value.selectedCurrency?.let { setProfileCurrencyUseCase(it.code) }
        }
    }

    private fun isError(key: String) = key.isEmpty() || key.isBlank() || key.contains(" ")

    private fun isDoneEnabled(key: String, currency: Currency?) = !isError(key) && currency != null

    data class UiState(
        val selectedCurrency: Currency?,
        val alphaVantageApiKey: String,
        val isDoneEnabled: Boolean,
        val isError: Boolean
    )
}

