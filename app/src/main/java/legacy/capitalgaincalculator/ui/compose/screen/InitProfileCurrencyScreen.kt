package legacy.capitalgaincalculator.ui.compose.screen

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import legacy.capitalgaincalculator.ui.viewmodel.InitProfileCurrencyViewModel
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.CurrencySelectorWidget
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingXXLarge
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.InitProfileCurrencyViewModel

@Composable
fun InitProfileCurrencyScreen(
    viewModel: InitProfileCurrencyViewModel = koinViewModel()
) {
    val state by viewModel.uiState.collectAsState()

    when (val uiState = state) {
        is InitProfileCurrencyViewModel.UiState.Idle -> {
            Box(modifier = Modifier.fillMaxSize()) {
                Column(
                    modifier = Modifier
                        .padding(paddingLarge).padding(bottom = paddingXXLarge)
                        .align(Alignment.Center)
                ) {
                    Text(
                        text = stringResource(id = R.string.profile_currency_promt),
                        modifier = Modifier.padding(paddingMedium)
                    )

                    CurrencySelectorWidget(
                        selectedCurrency = uiState.currency,
                        title = stringResource(id = R.string.profile_currency),
                        onCurrencySelected = { viewModel.onCurrencySelected(it) }
                    )

                    TextButton(
                        enabled = uiState.confirmEnabled,
                        onClick = { viewModel.onConfirmCurrency() },
                        modifier = Modifier
                            .padding(paddingMedium)
                            .align(Alignment.End)
                    ) {
                        Text(text = stringResource(id = android.R.string.ok))
                    }
                }
            }
        }

        InitProfileCurrencyViewModel.UiState.Loading -> Box(modifier = Modifier.fillMaxSize()) {
            CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
        }
    }
}