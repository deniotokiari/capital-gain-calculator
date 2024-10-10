package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiState
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose.AuthContent

@Preview(showBackground = true)
@Composable
fun AuthPreviewLoading() = AuthContent(
    uiState = AuthUiState.Loading,
)

@Preview(showBackground = true)
@Composable
fun AuthPreviewError() = AuthContent(
    uiState = AuthUiState.Error,
)