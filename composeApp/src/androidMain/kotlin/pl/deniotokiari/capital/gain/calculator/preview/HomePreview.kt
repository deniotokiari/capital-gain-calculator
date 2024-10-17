package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.HomeUiState
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.compose.HomeContent

@Preview(showBackground = true)
@Composable
fun HomePreviewLoading() = HomeContent(
    uiState = HomeUiState.Loading,
)

@Preview(showBackground = true)
@Composable
fun HomePreviewError() = HomeContent(
    uiState = HomeUiState.Error,
)

@Preview(showBackground = true)
@Composable
fun HomePreviewPortfolios() = HomeContent(
    uiState = HomeUiState.Portfolios(emptyList()),
)