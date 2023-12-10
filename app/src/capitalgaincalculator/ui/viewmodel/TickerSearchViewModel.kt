@file:OptIn(FlowPreview::class)

package legacy.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.FlowPreview
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.debounce
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import legacy.capitalgaincalculator.domain.usecase.SearchTickerUseCase
import legacy.capitalgaincalculator.ui.navigation.AppHostNavigation
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.domain.usecase.SearchTickerUseCase
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class TickerSearchViewModel(
    private val searchTickerUseCase: SearchTickerUseCase,
    private val appNavigation: AppHostNavigation
) : ViewModel() {
    private val query = MutableStateFlow("")
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    private var searchJob: Job? = null

    init {
        viewModelScope.launch {
            query.debounce(250L).collect {
                searchJob?.cancel()

                if (it.isEmpty() || it.isBlank()) {
                    _uiState.value = UiState.default()
                } else {
                    searchJob = launch {
                        val items = searchTickerUseCase(it).map { item -> item.toViewModel() }

                        _uiState.value = UiState(
                            items = items,
                            loading = false,
                            noResult = items.isEmpty()
                        )
                    }
                }
            }
        }
    }

    fun onQueryChanged(query: String) {
        searchJob?.cancel()
        //_uiState.update { UiState.loading() }
        this.query.update { query }
    }

    fun onSearchResultClicked(index: Int) {
        uiState.value.items.getOrNull(index)?.let {
            appNavigation.popBackStack(it.ticker)
        }
    }

    data class UiState(
        val items: List<SearchResult>,
        val loading: Boolean,
        val noResult: Boolean
    ) {
        data class SearchResult(
            val title: String,
            internal val ticker: Ticker.Search
        )

        companion object {
            fun default(): UiState = UiState(
                items = emptyList(),
                loading = false,
                noResult = false
            )

            fun loading(): UiState = UiState(
                items = emptyList(),
                loading = true,
                noResult = false
            )
        }
    }
}

private fun Ticker.Search.toViewModel(): TickerSearchViewModel.UiState.SearchResult =
    TickerSearchViewModel.UiState.SearchResult(
        title = "$symbol - $name - $region - $currency",
        ticker = this
    )