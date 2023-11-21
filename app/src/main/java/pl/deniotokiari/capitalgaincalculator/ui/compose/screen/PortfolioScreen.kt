@file:OptIn(ExperimentalMaterial3Api::class)

package pl.deniotokiari.capitalgaincalculator.ui.compose.screen

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
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

        TextButton(
            onClick = viewModel::onAddTickerCLicked,
            modifier = Modifier.align(Alignment.CenterHorizontally)
        ) {
            Text(text = stringResource(id = R.string.ticker_add))
        }

        if (state.loading) {
            Box(modifier = Modifier.fillMaxSize()) {
                CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxWidth()
            ) {
                state.tickers.forEachIndexed { index, item ->
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
                                    Text(text = stringResource(id = R.string.portfolio_add))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}