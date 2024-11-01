package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListUiState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.ItemsBottomSheetState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.compose.Currencies
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
        itemsBottomSheetState = null,
    ),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CurrenciesListDataSelectedPreview() = CurrenciesListContent(
    uiState = CurrenciesListUiState.Data(
        currencies = emptyList(),
        currentCurrency = Currency.Physical(name = "Polish zloty", code = "PLN"),
        itemsBottomSheetState = null,
    ),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CurrenciesEmptyPreview() = Currencies(
    state = ItemsBottomSheetState(
        currencies = emptyList(),
    ),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CurrenciesItemsPreview() = Currencies(
    currentLabel = "EUR - Euro",
    state = ItemsBottomSheetState(
        currencies = listOf(
            Currency.Physical(name = "Polish zloty", code = "PLN"),
            Currency.Physical(name = "Euro", code = "EUR"),
            Currency.Digital(name = "Bitcoin", code = "BTC"),
        ),
    ),
    onAction = {},
)

@Preview(showBackground = true)
@Composable
fun CurrenciesEmptySearchPreview() = Currencies(
    currentLabel = null,
    state = ItemsBottomSheetState(
        currencies = emptyList(),
        searchValue = "PLN!",
    ),
    onAction = {},
)
