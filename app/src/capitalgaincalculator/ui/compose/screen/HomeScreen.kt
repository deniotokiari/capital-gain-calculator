@file:OptIn(ExperimentalFoundationApi::class)

package legacy.capitalgaincalculator.ui.compose.screen

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.CircularProgressIndicator
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
import legacy.capitalgaincalculator.ui.viewmodel.HomeViewModel
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.AppHeaderWidget
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.AppHeaderWidgetAction
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.MarketValueWidget
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.HomeViewModel

@Composable
fun HomeScreen(viewModel: HomeViewModel = koinViewModel()) {
    Column(
        modifier = Modifier.fillMaxSize()
    ) {
        AppHeaderWidget(
            title = stringResource(id = R.string.portfolios),
            leftAction = AppHeaderWidgetAction.Left.About
        )

        val state by viewModel.uiState.collectAsState()

        when {
            state.loading -> Loading()
            else -> Idle(
                state = state,
                addPortfolio = viewModel::onAddPortfolioClicked,
                navigateToPortfolio = viewModel::onPortfolioClicked,
                onDeletePortfolio = viewModel::onDeletePortfolio
            )
        }
    }
}

@Composable
private fun Idle(
    state: HomeViewModel.UiState,
    addPortfolio: () -> Unit,
    onDeletePortfolio: (String) -> Unit,
    navigateToPortfolio: (Int) -> Unit
) {
    when {
        state.portfolios.isEmpty() -> Box(modifier = Modifier.fillMaxSize()) {
            TextButton(
                modifier = Modifier.align(Alignment.Center),
                onClick = addPortfolio
            ) {
                Text(text = stringResource(id = R.string.portfolio_add))
            }
        }

        else -> {
            Column {
                TextButton(
                    onClick = addPortfolio,
                    modifier = Modifier.align(Alignment.CenterHorizontally)
                ) {
                    Text(text = stringResource(id = R.string.portfolio_add))
                }

                state.marketDataForAllPortfolios?.let { MarketValueWidget(marketData = it) }

                LazyColumn {
                    state.portfolios.forEachIndexed { index, portfolio ->
                        item(portfolio.name) {
                            var showDeleteDialog by remember(portfolio.name) { mutableStateOf(false) }

                            Box(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .combinedClickable(
                                        onClick = { navigateToPortfolio(index) },
                                        onLongClick = { showDeleteDialog = true }
                                    )
                            ) {
                                MarketValueWidget(
                                    marketData = portfolio.data
                                ) {
                                    Text(text = portfolio.name, fontSize = 14.sp)
                                }
                            }

                            if (showDeleteDialog) {
                                AlertDialog(
                                    onDismissRequest = { showDeleteDialog = false },
                                    confirmButton = {
                                        Text(
                                            text = stringResource(id = android.R.string.ok),
                                            modifier = Modifier.clickable {
                                                onDeletePortfolio(portfolio.name)
                                                showDeleteDialog = false
                                            }
                                        )
                                    },
                                    text = {
                                        Text(
                                            text = stringResource(
                                                id = R.string.delete_portfolio,
                                                portfolio.name
                                            )
                                        )
                                    },
                                    dismissButton = {
                                        Text(
                                            text = stringResource(id = android.R.string.cancel),
                                            modifier = Modifier.clickable { showDeleteDialog = false }
                                        )
                                    }
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun Loading() {
    Box(modifier = Modifier.fillMaxSize()) {
        CircularProgressIndicator(
            modifier = Modifier.align(Alignment.Center)
        )
    }
}