package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@KoinViewModel
class PortfolioViewModel(
    private val id: String,
    private val appNavigation: AppHostNavigation
) : ViewModel() {
    fun onAddTickerCLicked() {
        viewModelScope.launch {
            val ticker = appNavigation.navigateToTickerSearch()
        }
    }
}