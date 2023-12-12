package pl.deniotokiari.feature.init_profile

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import org.koin.androidx.compose.koinViewModel

@Composable
fun InitProfileScreen(
    viewModel: InitProfileViewModel = koinViewModel()
) {
    Box(modifier = Modifier.fillMaxSize()) {
        val state by viewModel.uiState.collectAsState()

        when (state) {
            is InitProfileViewModel.UiState.Idle -> TODO()
            InitProfileViewModel.UiState.Loading -> CircularProgressIndicator()
        }
    }
}