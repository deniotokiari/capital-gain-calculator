package pl.deniotokiari.capitalgaincalculator.feature.home

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import pl.deniotokiari.capitalgaincalculator.feature.main.LocalNavController
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.AddPortfolioScreen
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.Portfolio
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.toDbPortfolio
import pl.deniotokiari.capitalgaincalculator.navigation.Route
import pl.deniotokiari.capitalgaincalculator.ui.theme.Purple40

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun HomeScreen(homeViewModel: HomeViewModel) {
    Column(
        modifier = Modifier.padding(16.dp)
    ) {
        var isExpanded by rememberSaveable { mutableStateOf(false) }
        var portfolioForDelete: Portfolio? by rememberSaveable { mutableStateOf(null) }

        Text(
            text = "+ Add Portfolio",
            modifier = Modifier
                .clickable { isExpanded = !isExpanded }
                .align(Alignment.CenterHorizontally),
            color = Purple40
        )

        val uiState by homeViewModel.uiState.collectAsState()
        val navController = LocalNavController.current

        LazyColumn {
            uiState.portfolios.forEach {
                item {
                    Row(
                        modifier = Modifier
                            .padding(vertical = 4.dp)
                            .fillParentMaxWidth()
                            .combinedClickable(
                                onClick = {
                                    navController.navigate(Route.Portfolio.makeRoute(it.toDbPortfolio().id))
                                },
                                onLongClick = {
                                    portfolioForDelete = it
                                }
                            )
                    ) {
                        Text(
                            text = it.name
                        )
                    }
                }
            }
        }

        if (isExpanded) {
            AddPortfolioScreen(
                onDismiss = {
                    isExpanded = false
                },
                onPortfolio = {
                    homeViewModel.onAddPortfolio(it)
                }
            )
        }

        if (portfolioForDelete != null) {
            AlertDialog(
                onDismissRequest = { portfolioForDelete = null },
                title = { Text(text = "Delete ${portfolioForDelete?.name}?") },
                confirmButton = {
                    TextButton(
                        onClick = {
                            homeViewModel.onDeletePortfolio(portfolioForDelete!!)
                            portfolioForDelete = null
                        }
                    ) {
                        Text(text = "OK")
                    }
                },
                dismissButton = {
                    TextButton(
                        onClick = { portfolioForDelete = null }) {
                        Text(text = "Cancel")
                    }
                }
            )
        }
    }
}