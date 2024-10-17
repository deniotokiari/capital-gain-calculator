package pl.deniotokiari.capital.gain.calculator.feature.home.presentation.compose

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.HomeUiState
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.HomeViewModel
import pl.deniotokiari.capital.gain.calculator.uikit.compose.GenericErrorWithRetry

@Composable
fun HomeScreen() {
    val viewModel = koinViewModel<HomeViewModel>()
    val uisState by viewModel.uiState.collectAsState()

    HomeContent(
        uiState = uisState,
    )
}

@Composable
fun HomeContent(
    uiState: HomeUiState,
) {
    when (uiState) {
        HomeUiState.Error -> GenericErrorWithRetry(
            onRetry = {},
        )

        HomeUiState.Loading -> Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center,
        ) {
            CircularProgressIndicator()
        }

        is HomeUiState.Portfolios -> Text("portfolios")
    }
}