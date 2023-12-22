package pl.deniotokiari.feature.add_portfolio.presentation

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.core.ui.theme.paddingLarge
import pl.deniotokiari.core.ui.theme.paddingMedium
import pl.deniotokiari.core.ui.theme.paddingSmall
import pl.deniotokiari.core.ui.widget.ItemSelectorWidget
import pl.deniotokiari.feature.add_portfolio.viewmodel.AddPortfolioViewModel

@Composable
fun AddPortfolioSheet(viewModel: AddPortfolioViewModel = koinViewModel()) {
    Column(
        modifier = Modifier.padding(paddingLarge)
    ) {
        val uiState by viewModel.uiState.collectAsState()

        OutlinedTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = paddingSmall),
            value = uiState.name,
            onValueChange = viewModel::onNameChanged,
            placeholder = { Text(text = "Portfolio name") },
            maxLines = 1
        )


        ItemSelectorWidget(
            title = uiState.currencySelectorTitle,
            label = uiState.currencySelectorLabel,
            items = uiState.currenciesSelectorItems,
            selected = uiState.selectedCurrencyIndex,
            onSelected = viewModel::onCurrencySelected
        )

        TextButton(
            onClick = viewModel::onConfirmClicked,
            enabled = uiState.confirmEnabled,
            modifier = Modifier
                .padding(paddingMedium)
                .padding(bottom = paddingLarge)
                .align(Alignment.End)
        ) {
            Text(text = stringResource(id = android.R.string.ok))
        }
    }
}