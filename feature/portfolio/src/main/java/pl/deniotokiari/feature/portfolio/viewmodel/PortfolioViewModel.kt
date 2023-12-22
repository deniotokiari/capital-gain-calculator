package pl.deniotokiari.feature.portfolio.viewmodel

import androidx.lifecycle.ViewModel
import org.koin.android.annotation.KoinViewModel

@KoinViewModel
class PortfolioViewModel(
    private val id: String
): ViewModel() {
}