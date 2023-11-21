package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.model.Position
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation
import java.math.BigDecimal
import java.time.LocalDate

@KoinViewModel
class PositionAddViewModel(
    private val appHostNavigation: AppHostNavigation
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    fun onOkClicked() {
        appHostNavigation.popBackStack(
            Position(
                count = requireNotNull(uiState.value.count),
                price = requireNotNull(uiState.value.price),
                date = requireNotNull(uiState.value.date)
            )
        )
    }

    fun onCountChanged(count: BigDecimal) {

    }

    fun onPriceChanged(price: CurrencyValue) {

    }

    fun onDateChanged(date: LocalDate) {

    }

    data class UiState(
        val count: BigDecimal?,
        val price: CurrencyValue?,
        val date: LocalDate?,
        val okEnabled: Boolean
    ) {
        companion object {
            fun default(): UiState = UiState(
                count = null,
                price = null,
                date = null,
                okEnabled = false
            )
        }
    }
}