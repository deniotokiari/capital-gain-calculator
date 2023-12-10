package legacy.capitalgaincalculator.ui.compose.widget

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.ui.theme.Purple40
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.CurrencySelectorViewModel

@Composable
fun CurrenciesListWithSearchWidget(
    onCurrencySelected: (Currency) -> Unit,
    viewModel: CurrencySelectorViewModel = koinViewModel()
) {
    val state by viewModel.uiState.collectAsState()
    var searchInput by remember { mutableStateOf("") }

    OutlinedTextField(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        value = searchInput,
        onValueChange = {
            searchInput = it

            viewModel.onQueryChange(searchInput)
        },
        label = { Text(text = "Search for currency") },
        singleLine = true
    )
    LazyColumn {
        state.items
            .forEach {
                item(key = it.currency.title) {
                    Text(
                        text = it.title,
                        modifier = Modifier
                            .clickable { onCurrencySelected(it.currency) }
                            .fillParentMaxWidth()
                            .padding(16.dp),
                        color = if (it.selected) {
                            Purple40
                        } else {
                            Color.Unspecified
                        }
                    )
                }
            }
    }
}