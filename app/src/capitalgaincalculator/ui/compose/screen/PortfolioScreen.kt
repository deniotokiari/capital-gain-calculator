@file:OptIn(ExperimentalMaterial3Api::class)

package legacy.capitalgaincalculator.ui.compose.screen

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.sp
import org.koin.androidx.compose.koinViewModel
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.AppHeaderWidget
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.AppHeaderWidgetAction
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.MarketValueWidget
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.PortfolioViewModel

@Composable
fun PortfolioScreen(
    id: String,
    viewModel: PortfolioViewModel = koinViewModel(parameters = { parametersOf(id) })
) {
    Column(modifier = Modifier.fillMaxSize()) {
        val state by viewModel.uiState.collectAsState()

        AppHeaderWidget(
            title = state.portfolioName,
            leftAction = AppHeaderWidgetAction.Left.Back
        )

        MarketValueWidget(
            marketData = state.portfolioMarketData,
            modifier = Modifier.align(Alignment.CenterHorizontally),
            fontSize = 15.sp
        )

        var addTicker by remember { mutableStateOf(false) }
        var addCurrency by remember { mutableStateOf(false) }

        if (addTicker) {
            AlertDialog(
                onDismissRequest = { addTicker = false },
                confirmButton = { },
                dismissButton = {
                    Text(
                        text = stringResource(id = android.R.string.cancel),
                        modifier = Modifier.clickable { addTicker = false }
                    )
                },
                text = {
                    Column {
                        TextButton(
                            onClick = {
                                viewModel.onAddTickerClicked()
                                addTicker = false
                            }
                        ) { Text(text = "Add manually") }
                        TextButton(
                            onClick = {
                                viewModel.onImportTickerFromRevolutClicked()
                                addTicker = false
                            }
                        ) { Text(text = "Import from Revolut") }
                        TextButton(
                            onClick = {
                                viewModel.onImportFromTrading212Clicked()
                                addTicker = false
                            }
                        ) { Text(text = "Import from Trading212") }
                    }
                }
            )
        }

        if (addCurrency) {
            AlertDialog(
                onDismissRequest = { addCurrency = false },
                confirmButton = { },
                dismissButton = {
                    Text(
                        text = stringResource(id = android.R.string.cancel),
                        modifier = Modifier.clickable { addCurrency = false }
                    )
                },
                text = {
                    Column {
                        TextButton(
                            onClick = {
                                viewModel.onAddCurrencyClicked()
                                addCurrency = false
                            }
                        ) { Text(text = "Add manually") }
                        TextButton(
                            onClick = {
                                viewModel.onImportCurrencyFromRevolutClicked()
                                addCurrency = false
                            }
                        ) { Text(text = "Import from Revolut") }
                    }
                }
            )
        }

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceAround
        ) {
            TextButton(
                onClick = { addTicker = true }
            ) {
                Text(text = stringResource(id = R.string.ticker_add))
            }

            TextButton(
                onClick = { addCurrency = true }
            ) {
                Text(text = stringResource(id = R.string.currency_add))
            }
        }

        if (state.loading) {
            Box(modifier = Modifier.fillMaxSize()) {
                CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxWidth()
            ) {
                state.instruments.forEachIndexed { index, item ->
                    val expanded = item.expanded

                    item(item.name) {
                        MarketValueWidget(
                            marketData = item.data,
                            modifier = Modifier.clickable { viewModel.onTickerClicked(index) }
                        ) {
                            Row {
                                ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded)

                                Text(
                                    text = item.name,
                                    fontSize = 14.sp
                                )
                            }
                        }
                    }

                    if (expanded) {
                        item("${item.name}-expanded") {
                            Column(modifier = Modifier.fillMaxWidth()) {
                                TextButton(
                                    onClick = { viewModel.onAddPositionClicked(index) },
                                    modifier = Modifier.align(Alignment.CenterHorizontally)
                                ) {
                                    Text(text = stringResource(id = R.string.position_add))
                                }
                            }
                        }

                        item.positions.forEachIndexed { i, position ->
                            item("${item.instrumentId}-$i") {
                                MarketValueWidget(
                                    marketData = position.data,
                                    fontSize = 12.sp
                                ) {
                                    Row {
                                        Text(
                                            text = if (position.showSymbol) {
                                                "${position.count}${item.name}"
                                            } else {
                                                position.count
                                            },
                                            fontSize = 12.sp
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}