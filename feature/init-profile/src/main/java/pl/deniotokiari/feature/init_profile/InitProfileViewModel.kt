package pl.deniotokiari.feature.init_profile

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import org.koin.android.annotation.KoinViewModel

@KoinViewModel
class InitProfileViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(UiState.Loading)

    fun onCurrencySelected(index: Int) {

    }

    fun onConfirmClicked() {

    }

    sealed class UiState {
        object Loading : UiState()

        data class Idle(
            val currency: String,
            val confirmEnabled: Boolean
        ) : UiState()
    }
}