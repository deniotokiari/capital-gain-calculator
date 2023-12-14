package pl.deniotokiari.feature.init_profile.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.domain.model.Currency
import pl.deniotokiari.domain.usecase.currency.GetCurrenciesUseCase
import pl.deniotokiari.domain.usecase.profile.IsProfileCurrencySetUseCase
import pl.deniotokiari.domain.usecase.currency.ScheduleCurrenciesUpdateUseCase
import pl.deniotokiari.domain.usecase.profile.SetProfileCurrencyUseCase
import pl.deniotokiari.navigation.AppNavigation

@KoinViewModel
class InitProfileViewModel(
    private val scheduleCurrenciesUpdateUseCase: ScheduleCurrenciesUpdateUseCase,
    private val getCurrenciesUseCase: GetCurrenciesUseCase,
    private val isProfileCurrencySetUseCase: IsProfileCurrencySetUseCase,
    private val setProfileCurrencyUseCase: SetProfileCurrencyUseCase,
    private val appNavigation: AppNavigation
) : ViewModel() {
    private val _uiState: MutableStateFlow<UiState> = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        viewModelScope.launch {
            if (isProfileCurrencySetUseCase(Unit)) {
                appNavigation.navigateToHomeFromInitProfileCurrency()
            } else {
                getCurrenciesUseCase(Unit).collect { items ->
                    _uiState.update {
                        it.copy(
                            currencies = items.toViewModelList(),
                            confirmEnabled = false,
                            loading = false,
                        )
                    }
                }
            }
        }

        viewModelScope.launch {
            scheduleCurrenciesUpdateUseCase(Unit)
        }
    }

    fun onCurrencySelected(index: Int) {
        _uiState.update { state ->
            state.copy(
                selected = index,
                title = state.currencies[index],
                confirmEnabled = true
            )
        }
    }

    fun onConfirmClicked() {
        viewModelScope.launch {
            _uiState.value.selected?.let { index ->
                setProfileCurrencyUseCase(_uiState.value.currencies[index])
            }
        }
    }

    data class UiState(
        val selected: Int?,
        val confirmEnabled: Boolean,
        val currencies: List<String>,
        val loading: Boolean,
        val title: String,
        val label: String
    ) {
        companion object {
            fun default() = UiState(
                selected = null,
                confirmEnabled = false,
                currencies = emptyList(),
                loading = true,
                title = "Profile Currency",
                label = "Search for currency"
            )
        }
    }
}

private fun Currency.toViewModel(): String = "$code - ${name ?: "N/A"}"

private fun List<Currency>.toViewModelList(): List<String> = map { it.toViewModel() }