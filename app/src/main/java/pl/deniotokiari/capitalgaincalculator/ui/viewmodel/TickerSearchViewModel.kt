@file:OptIn(FlowPreview::class)

package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.FlowPreview
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.debounce
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.domain.usecase.SearchTickerUseCase

@KoinViewModel
class TickerSearchViewModel(
    private val searchTickerUseCase: SearchTickerUseCase
) : ViewModel() {
    private val query = MutableStateFlow("")
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    private var searchJob: Job? = null

    init {
        viewModelScope.launch {
            query.debounce(250L).collect {
                if (it.isEmpty() || it.isBlank()) {
                    searchJob?.cancel()
                    _uiState.value = UiState.default()

                    return@collect
                }

                _uiState.value = UiState.loading()

                searchJob?.cancel()

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

    fun onQueryChanged(query: String) {
        this.query.update { query }
    }

    fun onSearchResultClicked(index: Int) {

    }

    data class UiState(
        val items: List<SearchResult>,
        val loading: Boolean,
        val noResult: Boolean
    ) {
        data class SearchResult(
            val title: String
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
        title = "$symbol - $name - $region - $currency"
    )