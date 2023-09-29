package pl.deniotokiari.capitalgaincalculator.feature.portfolio

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.currency.CurrencySelector

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AddPortfolioScreen(
    onDismiss: () -> Unit,
    onPortfolio: (Portfolio) -> Unit
) {
    var portfolioName: String? by rememberSaveable { mutableStateOf(null) }
    var currency: Currency? by rememberSaveable { mutableStateOf(null) }
    var error by rememberSaveable { mutableStateOf(false) }
    val validate = { value: String -> value.isEmpty() || value.isBlank() || value.contains(" ") }

    ModalBottomSheet(
        onDismissRequest = {
            onDismiss()
        }
    ) {
        Column(
            modifier = Modifier.padding(horizontal = 16.dp)
        ) {
            OutlinedTextField(
                value = portfolioName ?: "",
                onValueChange = {
                    portfolioName = it
                    error = validate(it)
                },
                isError = error,
                label = { Text(text = "Portfolio name") },
                modifier = Modifier.fillMaxWidth()
            )

            CurrencySelector(
                onSelected = {
                    currency = it
                }
            )
            Button(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 4.dp, bottom = 16.dp),
                onClick = {
                    onPortfolio(Portfolio(name = portfolioName!!, currency = currency!!))
                    onDismiss()
                },
                enabled = currency != null && !error && portfolioName != null
            ) {
                Text(text = stringResource(id = R.string.done))
            }
        }
    }
}