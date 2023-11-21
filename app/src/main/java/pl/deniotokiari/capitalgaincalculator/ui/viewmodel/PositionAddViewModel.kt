package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
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

    private fun validateDigitsInput(input: String): Boolean =
        input.toBigDecimalOrNull()?.let { it >= BigDecimal.ZERO } == true

    fun onOkClicked() {
        appHostNavigation.popBackStack(
            Position(
                count = requireNotNull(uiState.value.count.toBigDecimal()),
                price = CurrencyValue(
                    value = requireNotNull(uiState.value.price.toBigDecimal()),
                    currency = requireNotNull(uiState.value.currency)
                ),
                date = requireNotNull(uiState.value.date)
            )
        )
    }

    fun onCountChanged(count: String) {
        if (validateDigitsInput(count)) {
            _uiState.update { it.copy(count = count) }
        }
    }

    fun onPriceChanged(price: String) {
        if (validateDigitsInput(price)) {
            _uiState.update { it.copy(price = price) }
        }
    }

    fun onCurrencyChanged(currency: Currency) {
        _uiState.update { it.copy(currency = currency) }
    }

    fun onDateChanged(date: LocalDate) {
        _uiState.update { it.copy(date = date) }
    }

    data class UiState(
        val count: String,
        val price: String,
        val currency: Currency?,
        val date: LocalDate?
    ) {
        val okEnabled: Boolean
            get() = count.isNotEmpty()
                    && count.isNotBlank()
                    && price.isNotEmpty()
                    && price.isNotBlank()
                    && currency != null
                    && date != null

        companion object {
            fun default(): UiState = UiState(
                count = "",
                price = "",
                currency = null,
                date = null
            )
        }
    }
}