package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddImportedCurrencyValuesUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddImportedTickerValuesUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.ImportRevolutCurrencyUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class ImportCurrencyFromRevolutViewModel(
    private val id: String,
    private val importRevolutCurrencyUseCase: ImportRevolutCurrencyUseCase,
    private val addImportedCurrencyValuesUseCase: AddImportedCurrencyValuesUseCase,
    private val appHostNavigation: AppHostNavigation
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState(loading = false))
    val uiState: StateFlow<UiState> = _uiState

    fun onDocumentSelected(uri: Uri?) {
        viewModelScope.launch {
            _uiState.update { it.copy(loading = true) }
            val map = uri?.let { importRevolutCurrencyUseCase(it) }

            if (map == null) {
                _uiState.update { it.copy(loading = false) }
            } else {
                addImportedCurrencyValuesUseCase(
                    AddImportedTickerValuesUseCase.Params(
                        map = map,
                        portfolioId = id
                    )
                )
            }

            _uiState.update { it.copy(loading = false) }

            appHostNavigation.popBackStack()
        }
    }

    data class UiState(
        val loading: Boolean
    )
}