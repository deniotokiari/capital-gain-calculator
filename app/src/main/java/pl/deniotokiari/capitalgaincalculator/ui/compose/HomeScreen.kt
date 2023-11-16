package pl.deniotokiari.capitalgaincalculator.ui.compose

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
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
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.sp
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.ui.activity.LocalNavController
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.HomeViewModel

@Composable
fun HomeScreen(viewModel: HomeViewModel = koinViewModel()) {
    val navController = LocalNavController.current

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(paddingLarge)
    ) {
        val state by viewModel.uiState.collectAsState()

        Box(
            modifier = Modifier.fillMaxWidth()
        ) {
            IconButton(onClick = { navController.navigate("about") }) {
                Icon(
                    imageVector = Icons.Outlined.Info,
                    contentDescription = stringResource(id = R.string.about_button_description)
                )
            }

            when (state) {
                is HomeViewModel.UiState.Idle -> {
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

                else -> Text(
                    text = stringResource(id = R.string.app_name),
                    modifier = Modifier.align(Alignment.Center),
                    style = TextStyle(
                        fontSize = 18.sp,
                        textAlign = TextAlign.Center
                    )
                )
            }
        }

        when (state) {
            is HomeViewModel.UiState.Idle -> Idle(state as HomeViewModel.UiState.Idle)
            HomeViewModel.UiState.InitProfileCurrency -> InitProfileCurrency(viewModel::onProfileCurrencySelected)
            HomeViewModel.UiState.Loading -> Loading()
        }
    }
}

@Composable
private fun Idle(state: HomeViewModel.UiState.Idle) {
    when {
        state.loading -> Loading()
        state.portfolios.isEmpty() -> Box(modifier = Modifier.fillMaxSize()) {
            TextButton(
                modifier = Modifier.align(Alignment.Center),
                onClick = { }
            ) {
                Text(text = stringResource(id = R.string.portfolio_add))
            }
        }

        else -> {

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
private fun InitProfileCurrency(onProfileCurrencySelected: (Currency) -> Unit) {
    Column(
        modifier = Modifier.padding(top = paddingMedium),
    ) {
        Text(
            text = stringResource(id = R.string.profile_currency_promt),
            modifier = Modifier.padding(paddingMedium)
        )

        var currency: Currency? by remember { mutableStateOf(null) }

        CurrencySelector(
            selectedCurrency = currency,
            title = stringResource(id = R.string.profile_currency),
            onCurrencySelected = { currency = it }
        )

        TextButton(
            enabled = currency != null,
            onClick = { currency?.let { onProfileCurrencySelected(it) } },
            modifier = Modifier
                .padding(paddingMedium)
                .align(Alignment.End)
        ) {
            Text(text = stringResource(id = android.R.string.ok))
        }
    }
}