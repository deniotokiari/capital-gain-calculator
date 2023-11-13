@file:OptIn(ExperimentalMaterial3Api::class)

package pl.deniotokiari.capitalgaincalculator.ui.compose

import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.PressInteraction
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.ui.theme.Purple40
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.CurrencySelectorViewModel

@Composable
fun CurrencySelector(
    selectedCurrency: Currency?,
    onCurrencySelected: (Currency) -> Unit,
    viewModel: CurrencySelectorViewModel = koinViewModel()
) {
    val state by viewModel.uiState.collectAsState()
    var isExpanded by rememberSaveable { mutableStateOf(false) }

    TextField(
        value = selectedCurrency?.title ?: "",
        onValueChange = {},
        readOnly = true,
        trailingIcon = {
            if (state.loading) {
                CircularProgressIndicator(strokeWidth = 2.dp)
            } else {
                ExposedDropdownMenuDefaults.TrailingIcon(expanded = isExpanded)
            }
        },
        colors = ExposedDropdownMenuDefaults.textFieldColors(),
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = 2.dp),
        placeholder = { Text(text = stringResource(id = R.string.profile_currency)) },
        interactionSource = remember { MutableInteractionSource() }.also { interactionSource ->
            LaunchedEffect(interactionSource) {
                interactionSource.interactions.collect {
                    if (it is PressInteraction.Release) {
                        isExpanded = !isExpanded
                    }
                }
            }
        },
        enabled = state.enabled
    )

    if (isExpanded) {
        ModalBottomSheet(
            onDismissRequest = { isExpanded = false }
        ) {
            var searchInput by rememberSaveable { mutableStateOf("") }

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
                                    .clickable {
                                        viewModel.onSelectedCurrencyChange(it.currency)
                                        onCurrencySelected(it.currency)
                                        isExpanded = false
                                    }
                                    .fillParentMaxWidth()
                                    .padding(16.dp), color = if (it.selected) {
                                    Purple40
                                } else {
                                    Color.Unspecified
                                }
                            )
                        }
                    }
            }
        }
    }
}