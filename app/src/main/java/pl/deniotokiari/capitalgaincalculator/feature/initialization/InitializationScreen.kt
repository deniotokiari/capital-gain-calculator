@file:OptIn(ExperimentalMaterial3Api::class)

package pl.deniotokiari.capitalgaincalculator.feature.initialization

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.currency.CurrencySelector

@Composable
fun InitializationScreen(viewModel: InitializationViewModel) {
    val uiState: InitializationViewModel.UiState by viewModel.uiState.collectAsState()

    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp)
            .offset(y = 32.dp)
    ) {
        OutlinedTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 2.dp),
            value = uiState.alphaVantageApiKey,
            onValueChange = viewModel::onAlphaVantageApiKeyUpdated,
            label = { Text(text = stringResource(id = R.string.alpha_vantage_api_key)) },
            singleLine = true,
            isError = uiState.isError
        )
        CurrencySelector(
            initialCurrency = uiState.selectedCurrency,
            onSelected = { viewModel.onProfileCurrencySelected(it) }
        )
        Button(
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 4.dp), onClick = viewModel::onDoneClicked,
            enabled = uiState.isDoneEnabled
        ) {
            Text(text = stringResource(id = R.string.done))
        }
    }
}
