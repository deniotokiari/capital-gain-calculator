package legacy.capitalgaincalculator.ui.compose.sheet

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.OutlinedTextField
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
import legacy.capitalgaincalculator.ui.viewmodel.AddPortfolioViewModel
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.CurrencySelectorWidget
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingSmall
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.AddPortfolioViewModel

@Composable
fun AddPortfolioSheet(viewModel: AddPortfolioViewModel = koinViewModel()) {
    var portfolioName: String by remember { mutableStateOf("") }

    Column(
        modifier = Modifier.padding(paddingLarge)
    ) {
        val state by viewModel.uiState.collectAsState()

        OutlinedTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = paddingSmall),
            value = portfolioName,
            onValueChange = {
                portfolioName = it
                viewModel.onPortfolioNameChanged(portfolioName)
            },
            placeholder = { Text(text = stringResource(id = R.string.portfolio_name)) },
            maxLines = 1
        )

        var currency: Currency? by remember { mutableStateOf(null) }

        CurrencySelectorWidget(
            selectedCurrency = currency,
            title = stringResource(id = R.string.portfolio_currency),
            onCurrencySelected = {
                currency = it
                viewModel.onPortfolioCurrencyChanged(it)
            }
        )

        TextButton(
            onClick = viewModel::onOk,
            enabled = state.okEnabled,
            modifier = Modifier
                .padding(paddingMedium)
                .padding(bottom = paddingLarge)
                .align(Alignment.End)
        ) {
            Text(text = stringResource(id = android.R.string.ok))
        }
    }
}