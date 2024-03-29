@file:OptIn(ExperimentalFoundationApi::class)

package pl.deniotokiari.feature.home.presentation

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
import org.koin.androidx.compose.koinViewModel
import org.koin.compose.koinInject
import pl.deniotokiari.core.ui.widget.AppHeaderWidget
import pl.deniotokiari.core.ui.widget.AppHeaderWidgetAction
import pl.deniotokiari.feature.home.R
import pl.deniotokiari.feature.home.viewmodel.HomeViewModel
import pl.deniotokiari.navigation.AppNavigation

@Composable
fun HomeScreen(
    viewModel: HomeViewModel = koinViewModel(),
    appNavigation: AppNavigation = koinInject()
) {
    Column(
        modifier = Modifier.fillMaxSize()
    ) {
        AppHeaderWidget(
            title = stringResource(id = R.string.portfolios),
            leftAction = AppHeaderWidgetAction.Left.About(appNavigation::navigateToAbout),
            action = appNavigation::navigateToSettings
        )

        val uiState by viewModel.uiState.collectAsState()

        when {
            uiState.loading -> Loading()
            uiState.items.isEmpty() -> Empty(viewModel::onAddPortfolio)
            else -> Items(
                items = uiState.items,
                onAddPortfolio = viewModel::onAddPortfolio,
                onPortfolioClicked = viewModel::onPortfolioClicked,
                onDeletePortfolio = viewModel::onDeletePortfolio
            )
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

@Composable
private fun Empty(onAddPortfolio: () -> Unit) {
    Box(modifier = Modifier.fillMaxSize()) {
        TextButton(
            modifier = Modifier.align(Alignment.Center),
            onClick = onAddPortfolio
        ) {
            Text(text = stringResource(id = R.string.portfolio_add))
        }
    }
}

@Composable
private fun Items(
    items: List<HomeViewModel.UiState.Portfolio>,
    onAddPortfolio: () -> Unit,
    onPortfolioClicked: (Int) -> Unit,
    onDeletePortfolio: (Int) -> Unit
) {
    Column {
        TextButton(
            onClick = onAddPortfolio,
            modifier = Modifier.align(Alignment.CenterHorizontally)
        ) {
            Text(text = stringResource(id = R.string.portfolio_add))
        }

        LazyColumn {
            items.forEachIndexed { index, portfolio ->
                item(portfolio.name) {
                    var showDeleteDialog by remember(portfolio.name) { mutableStateOf(false) }

                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .combinedClickable(
                                onClick = { onPortfolioClicked(index) },
                                onLongClick = { showDeleteDialog = true }
                            )
                    ) {
                        Text(text = portfolio.name, fontSize = 14.sp)
                    }

                    if (showDeleteDialog) {
                        AlertDialog(
                            onDismissRequest = { showDeleteDialog = false },
                            confirmButton = {
                                Text(
                                    text = stringResource(id = android.R.string.ok),
                                    modifier = Modifier.clickable {
                                        onDeletePortfolio(index)
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