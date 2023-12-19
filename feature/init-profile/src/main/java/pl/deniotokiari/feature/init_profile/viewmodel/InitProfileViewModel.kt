package pl.deniotokiari.feature.init_profile.viewmodel

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.core.common.launchInDefault
import pl.deniotokiari.domain.model.toViewModelList
import pl.deniotokiari.domain.usecase.currency.GetCurrenciesUseCase
import pl.deniotokiari.domain.usecase.currency.ScheduleCurrenciesUpdateUseCase
import pl.deniotokiari.domain.usecase.profile.IsProfileCurrencySetUseCase
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
        launchInDefault {
            if (isProfileCurrencySetUseCase(Unit)) {
                appNavigation.navigateToHomeFromInitProfileCurrency()
            } else {
                getCurrenciesUseCase(Unit).collect { items ->
                    _uiState.update {
                        it.copy(
                            currencies = items.toViewModelList(),
                            loading = false
                        )
                    }
                }
            }
        }
        launchInDefault {
            scheduleCurrenciesUpdateUseCase(Unit)
        }
    }

    fun onCurrencySelected(index: Int) {
        _uiState.update { state ->
            state.copy(
                selected = index,
                title = state.currencies[index]
            )
        }
    }

    fun onConfirmClicked() {
        launchInDefault {
            _uiState.value.selected?.let { index ->
                setProfileCurrencyUseCase(_uiState.value.currencies[index])
            }
        }
    }

    data class UiState(
        val selected: Int?,
        val currencies: List<String>,
        val loading: Boolean,
        val title: String,
        val label: String
    ) {
        val confirmEnabled: Boolean get() = selected != null

        companion object {
            fun default() = UiState(
                selected = null,
                currencies = emptyList(),
                loading = true,
                title = "Profile Currency",
                label = "Search for currency"
            )
        }
    }
}
