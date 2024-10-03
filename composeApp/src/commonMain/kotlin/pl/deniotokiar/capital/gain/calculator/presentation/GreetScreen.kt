package pl.deniotokiar.capital.gain.calculator.presentation

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.lifecycle.ViewModel
import capital_gain_calculator.composeapp.generated.resources.Res
import capital_gain_calculator.composeapp.generated.resources.compose_multiplatform
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import org.jetbrains.compose.resources.painterResource
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiar.capital.gain.calculator.Greeting

@Composable
fun GreetScreen() {
    val viewModel: GreetViewModel = koinViewModel()
    var showContent by remember { mutableStateOf(false) }
    val uiState by viewModel.uiState.collectAsState()

    Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally) {
        Button(onClick = { showContent = !showContent }) {
            Text("Click me!")
        }

        AnimatedVisibility(showContent) {
            Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally) {
                Image(painterResource(Res.drawable.compose_multiplatform), null)
                Text("Compose: ${uiState}")
            }
        }
    }
}

class GreetViewModel(
    private val greeting: Greeting,
) : ViewModel() {
    private val _uiState = MutableStateFlow("")
    val uiState: StateFlow<String> get() = _uiState

    init {
        _uiState.value = greeting.greet()
    }
}