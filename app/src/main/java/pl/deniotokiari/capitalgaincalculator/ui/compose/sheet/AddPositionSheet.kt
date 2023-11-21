package pl.deniotokiari.capitalgaincalculator.ui.compose.sheet

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.KeyboardType
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.CurrencySelectorWidget
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.DatePickerWidget
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingSmall
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.PositionAddViewModel

@Composable
fun PositionAddSheet(
    viewModel: PositionAddViewModel = koinViewModel()
) {
    Column(
        modifier = Modifier.padding(paddingLarge)
    ) {
        val state by viewModel.uiState.collectAsState()

        OutlinedTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = paddingSmall),
            value = state.count,
            onValueChange = {
                viewModel.onCountChanged(it)
            },
            placeholder = { Text(text = stringResource(id = R.string.count)) },
            maxLines = 1,
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Decimal)
        )

        OutlinedTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = paddingSmall),
            value = state.price,
            onValueChange = {
                viewModel.onPriceChanged(it)
            },
            placeholder = { Text(text = stringResource(id = R.string.price)) },
            maxLines = 1,
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Decimal)
        )

        CurrencySelectorWidget(
            selectedCurrency = state.currency,
            title = stringResource(id = R.string.currency),
            onCurrencySelected = viewModel::onCurrencyChanged
        )

        DatePickerWidget(
            onDateSelected = viewModel::onDateChanged,
            initialDate = state.date
        )

        TextButton(
            onClick = viewModel::onOkClicked,
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