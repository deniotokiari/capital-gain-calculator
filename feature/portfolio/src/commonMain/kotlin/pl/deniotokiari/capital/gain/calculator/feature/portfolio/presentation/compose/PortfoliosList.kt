package pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.compose

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Text
import androidx.compose.material.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_portfolio_currency
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_portfolio_name
import org.koin.compose.koinInject
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.PortfoliosAction
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.PortfoliosUiState
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.PortfoliosViewModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyUiGateway
import pl.deniotokiari.capital.gain.calculator.uikit.compose.GenericErrorWithRetry
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun PortfoliosList() {
    val viewModel = koinViewModel<PortfoliosViewModel>()
    val uiState by viewModel.uiState.collectAsState()

    PortfoliosListContent(
        uiState = uiState,
        onAction = viewModel::onAction,
    )
}

@Composable
fun PortfoliosListContent(
    uiState: PortfoliosUiState,
    onAction: (PortfoliosAction) -> Unit,
) {
    when (uiState) {
        is PortfoliosUiState.Data -> PortfolioItems(
            uiState = uiState,
            onAction = onAction,
        )

        PortfoliosUiState.Error -> GenericErrorWithRetry(onRetry = { onAction(PortfoliosAction.Retry) })
        PortfoliosUiState.Loading -> Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center,
        ) { CircularProgressIndicator() }
    }
}

@Composable
fun PortfolioItems(
    uiState: PortfoliosUiState.Data,
    onAction: (PortfoliosAction) -> Unit,
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
    ) {
        item {
            TextButton(
                onClick = {},
                modifier = Modifier.fillMaxWidth(),
            ) {
                Text(text = "+Add")
            }
        }

        uiState.items.forEach { item ->
            item(item.id) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { },
                ) {
                    Text(
                        modifier = Modifier
                            .padding(horizontal = 16.dp)
                            .padding(vertical = 12.dp)
                            .fillMaxWidth(),
                        text = item.name,
                    )
                }
            }
        }
    }
}

@Composable
fun CreatePortfolio() {
    val currencyUiGateway = koinInject<CurrencyUiGateway>()

    Column(
        modifier = Modifier.padding(16.dp),
    ) {
        OutlinedTextField(
            value = "",
            onValueChange = {},
            modifier = Modifier.fillMaxWidth(),
            label = { Text(stringResource(Res.string.ui_kit_portfolio_name)) },
        )

        currencyUiGateway.Currencies(
            label = stringResource(Res.string.ui_kit_portfolio_currency),
            modifier = Modifier.fillMaxWidth(),
            initialCurrency = null,
            onCurrencyChange = {},
        )
    }
}
