package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListUiState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.compose.CurrenciesListContent

@Preview(showBackground = true)
@Composable
fun CurrenciesListLoadingPreview() = CurrenciesListContent(
    uiState = CurrenciesListUiState.Loading,
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CurrenciesListErrorPreview() = CurrenciesListContent(
    uiState = CurrenciesListUiState.Error,
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CurrenciesListDataEmptyPreview() = CurrenciesListContent(
    uiState = CurrenciesListUiState.Data(
        currencies = emptyList(),
        currentCurrency = null,
        showItems = false,
    ),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CurrenciesListDataSelectedPreview() = CurrenciesListContent(
    uiState = CurrenciesListUiState.Data(
        currencies = emptyList(),
        currentCurrency = Currency.Physical(name = "Polish zloty", code = "PLN"),
        showItems = false,
    ),
    onAction = {},
)