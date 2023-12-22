package pl.deniotokiari.feature.home.viewmodel

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.core.common.launchInDefault
import pl.deniotokiari.domain.model.Portfolio
import pl.deniotokiari.domain.usecase.portfolio.DeletePortfolioUseCase
import pl.deniotokiari.domain.usecase.portfolio.GetPortfoliosUseCase
import pl.deniotokiari.navigation.AppNavigation

@KoinViewModel
class HomeViewModel(
    private val deletePortfolioUseCase: DeletePortfolioUseCase,
    private val getPortfoliosUseCase: GetPortfoliosUseCase,
    private val appNavigation: AppNavigation
) : ViewModel() {
    private val _uiState = MutableStateFlow(UiState.default())
    val uiState: StateFlow<UiState> = _uiState

    init {
        launchInDefault {
            getPortfoliosUseCase(Unit).collect { items ->
                _uiState.update { state ->
                    state.copy(
                        loading = false,
                        items = items.toViewModelList()
                    )
                }
            }
        }
    }

    fun onAddPortfolio() {
        appNavigation.navigateToAddPortfolio()
    }

    fun onPortfolioClicked(index: Int) {
        appNavigation.navigateToPortfolio(_uiState.value.items[index].name)
    }

    fun onDeletePortfolio(index: Int) {
        launchInDefault {
            deletePortfolioUseCase(_uiState.value.items[index].name)
        }
    }

    data class UiState(
        val loading: Boolean,
        val items: List<Portfolio>
    ) {
        data class Portfolio(
            val name: String
        )

        companion object {
            fun default() = UiState(
                loading = true,
                items = emptyList()
            )
        }
    }
}

private fun Portfolio.toViewModel(): HomeViewModel.UiState.Portfolio = HomeViewModel.UiState.Portfolio(
    name = name
)

private fun List<Portfolio>.toViewModelList(): List<HomeViewModel.UiState.Portfolio> = map {
    it.toViewModel()
}