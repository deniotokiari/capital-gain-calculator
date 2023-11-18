package pl.deniotokiari.capitalgaincalculator.ui.viewmodel

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import org.koin.android.annotation.KoinViewModel
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppNavigation

@KoinViewModel
class PortfolioViewModel(
    private val id: String,
    private val appNavigation: AppNavigation
) : ViewModel() {
    fun onAddTickerCLicked() {
        viewModelScope.launch {
            val r = appNavigation.navigateToTickerSearch()
            Log.d("LOG", "result => $r")
        }

    }
}