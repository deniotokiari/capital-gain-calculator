package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import androidx.lifecycle.ViewModel
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppNavigation

@KoinViewModel
class PortfolioViewModel(
    private val id: String,
    private val appNavigation: AppNavigation
) : ViewModel() {
    fun onAddTickerCLicked() {
        appNavigation.navigateToTickerSearch()
    }
}