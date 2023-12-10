package legacy.capitalgaincalculator.ui.viewmodel

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import legacy.capitalgaincalculator.domain.usecase.AddImportedTickerValuesUseCase
import legacy.capitalgaincalculator.domain.usecase.ImportTrading212TickersUseCase
import legacy.capitalgaincalculator.ui.navigation.AppHostNavigation
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.domain.usecase.AddImportedTickerValuesUseCase
import pl.deniotokiari.capitalgaincalculator.domain.usecase.ImportTrading212TickersUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class ImportFromTrading212ViewModel(
    private val id: String,
    private val importTrading212TickersUseCase: ImportTrading212TickersUseCase,
    private val addImportedTickerValuesUseCase: AddImportedTickerValuesUseCase,
    private val appHostNavigation: AppHostNavigation
) : ViewModel() {
    private val _uiState = MutableStateFlow(ImportTickerFromRevolutViewModel.UiState(loading = false))
    val uiState: StateFlow<ImportTickerFromRevolutViewModel.UiState> = _uiState

    fun onDocumentSelected(uri: Uri?) {
        viewModelScope.launch {
            _uiState.update { it.copy(loading = true) }
            val map = uri?.let { importTrading212TickersUseCase(it) }

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