package pl.deniotokiari.capitalgaincalculator.ui.compose

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Info
import androidx.compose.material.icons.outlined.Settings
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.sp
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.core.LocalNavController
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.HomeViewModel

@Composable
fun HomeScreen(viewModel: HomeViewModel = koinViewModel()) {
    val navController = LocalNavController.current

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(paddingLarge)
    ) {
        Box(
            modifier = Modifier.fillMaxWidth()
        ) {
            IconButton(onClick = {
                navController.navigate("about")
            }) {
                Icon(
                    imageVector = Icons.Outlined.Info,
                    contentDescription = stringResource(id = R.string.about_button_description)
                )
            }

            Text(
                text = stringResource(id = R.string.portfolios),
                modifier = Modifier.align(Alignment.Center),
                style = TextStyle(
                    fontSize = 18.sp,
                    textAlign = TextAlign.Center
                )
            )

            IconButton(
                modifier = Modifier.align(Alignment.CenterEnd),
                onClick = { navController.navigate("settings") }
            ) {
                Icon(
                    imageVector = Icons.Outlined.Settings,
                    contentDescription = stringResource(id = R.string.about_button_description)
                )
            }
        }

        val state by viewModel.uiState.collectAsState()

        when {
            state.loading -> Loading()
            else -> Idle(state)
        }
    }
}

@Composable
private fun Idle(state: HomeViewModel.UiState) {
    val navigation = LocalNavController.current

    when {
        state.portfolios.isEmpty() -> Box(modifier = Modifier.fillMaxSize()) {
            TextButton(
                modifier = Modifier.align(Alignment.Center),
                onClick = { navigation.navigate("portfolio_add") }
            ) {
                Text(text = stringResource(id = R.string.portfolio_add))
            }
        }

        else -> {
            LazyColumn() {
                state.portfolios.forEach { portfolio ->
                    item(portfolio.name) {
                        Box(modifier = Modifier
                            .fillMaxWidth()
                            .clickable { }) {
                            MarketValueRow(marketData = portfolio.data) {
                                Text(text = portfolio.name, fontSize = 14.sp)
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