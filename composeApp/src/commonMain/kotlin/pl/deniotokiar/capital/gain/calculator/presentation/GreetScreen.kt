package pl.deniotokiar.capital.gain.calculator.presentation

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import kotlinx.serialization.Serializable
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiar.capital.gain.calculator.Platform

@Composable
fun GreetScreen() {
    val viewModel: GreetViewModel = koinViewModel()
    val uiState by viewModel.uiState.collectAsState()

    Box(
        modifier = Modifier.fillMaxSize(),
    ) {
        when (val state = uiState) {
            is UiState.Error -> Text(text = state.message)
            UiState.Loading -> CircularProgressIndicator()
            is UiState.Users -> {
                LazyColumn {
                    items(state.users.size) { index ->
                        Text(text = state.users[index].name)
                    }
                }
            }
        }
    }
}

class GreetViewModel(
    private val platform: Platform,
) : ViewModel() {
    private val _uiState: MutableStateFlow<UiState> = MutableStateFlow(UiState.Loading)
    val uiState: StateFlow<UiState> get() = _uiState

    init {
        viewModelScope.launch(Dispatchers.Default) {
            runCatching {
                platform.getUsers()
            }.fold(
                onSuccess = { users ->
                    _uiState.update { UiState.Users(users) }
                },
                onFailure = { error ->
                    _uiState.update { UiState.Error(error.message ?: "Unknown error") }
                },
            )
        }
    }
}

sealed interface UiState {
    data object Loading : UiState
    data class Error(val message: String) : UiState
    data class Users(val users: List<User>) : UiState
}

@Serializable
data class User(
    val name: String,
    val age: Int,
)