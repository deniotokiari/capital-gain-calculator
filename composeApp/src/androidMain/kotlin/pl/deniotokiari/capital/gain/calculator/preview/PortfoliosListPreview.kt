package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.PreviewApplication
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.data.Portfolio
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.PortfoliosUiState
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.compose.CreatePortfolio
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.compose.PortfoliosListContent

@Preview(showBackground = true)
@Composable
fun PortfoliosListLoadingPreview() = PortfoliosListContent(
    uiState = PortfoliosUiState.Loading,
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun PortfoliosListErrorPreview() = PortfoliosListContent(
    uiState = PortfoliosUiState.Error,
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun PortfoliosListDataPreview() = PortfoliosListContent(
    uiState = PortfoliosUiState.Data(
        items = listOf(
            Portfolio(name = "Test_0", id = "0"),
            Portfolio(name = "Test_1", id = "1"),
            Portfolio(name = "Test_2", id = "2"),
        ),
    ),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun PortfoliosListDataEmptyPreview() = PortfoliosListContent(
    uiState = PortfoliosUiState.Data(
        items = listOf(),
    ),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CreatePortfolioPreview() = PreviewApplication {
    CreatePortfolio()
}

@OptIn(ExperimentalMaterial3Api::class)
@Preview(showBackground = true)
@Composable
fun CreatePortfolioInBottomSheetPreview() = PreviewApplication {
    ModalBottomSheet(
        onDismissRequest = {},
    ) {
        CreatePortfolio()
    }
}
