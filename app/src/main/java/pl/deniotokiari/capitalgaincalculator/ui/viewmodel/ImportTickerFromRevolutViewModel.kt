package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddImportedTickerValuesUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.ImportRevolutTickersUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class ImportTickerFromRevolutViewModel(
    private val id: String,
    private val importRevolutTickersUseCase: ImportRevolutTickersUseCase,
    private val addImportedTickerValuesUseCase: AddImportedTickerValuesUseCase,
    private val appHostNavigation: AppHostNavigation
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState(loading = false))
    val uiState: StateFlow<UiState> = _uiState

    fun onDocumentSelected(uri: Uri?) {
        viewModelScope.launch {
            _uiState.update { it.copy(loading = true) }
            val map = uri?.let { importRevolutTickersUseCase(it) }

            if (map == null) {
                _uiState.update { it.copy(loading = false) }
            } else {
                addImportedTickerValuesUseCase(
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