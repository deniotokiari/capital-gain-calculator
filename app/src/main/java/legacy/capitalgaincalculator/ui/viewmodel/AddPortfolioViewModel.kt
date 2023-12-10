package legacy.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import legacy.capitalgaincalculator.domain.usecase.AddPortfolioUseCase
import legacy.capitalgaincalculator.domain.usecase.ValidatePortfolioNameUseCase
import legacy.capitalgaincalculator.ui.navigation.AppHostNavigation
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.Portfolio
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddPortfolioUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.ValidatePortfolioNameUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class AddPortfolioViewModel(
    private val validatePortfolioNameUseCase: ValidatePortfolioNameUseCase,
    private val addPortfolioUseCase: AddPortfolioUseCase,
    private val appNavigation: AppHostNavigation
) : ViewModel() {
    private val _uiState = MutableStateFlow(
        UiState(
            okEnabled = false,
            currency = null,
            name = null
        )
    )
    val uiState: StateFlow<UiState> = _uiState

    fun onPortfolioNameChanged(name: String) {
        viewModelScope.launch {
            _uiState.update {
                val state = it.copy(name = name)

                state.copy(
                    okEnabled = state.isValid()
                            && validatePortfolioNameUseCase(name) is ValidatePortfolioNameUseCase.ValidationResult.Valid
                )
            }
        }
    }

    fun onPortfolioCurrencyChanged(currency: Currency) {
        _uiState.update {
            val state = it.copy(currency = currency)

            state.copy(okEnabled = state.isValid())
        }
    }

    fun onOk() {
        val name = uiState.value.name ?: return
        val currency = uiState.value.currency ?: return

        viewModelScope.launch {
            addPortfolioUseCase(
                Portfolio(
                    name = name,
                    currency = currency
                )
            )

            appNavigation.popBackStack()
        }
    }

    data class UiState(
        val okEnabled: Boolean,
        internal val currency: Currency?,
        internal val name: String?
    ) {
        fun isValid(): Boolean = currency != null && name != null
    }
}