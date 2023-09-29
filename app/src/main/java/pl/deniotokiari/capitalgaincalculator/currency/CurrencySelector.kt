package pl.deniotokiari.capitalgaincalculator.currency

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
import org.koin.compose.getKoin
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.theme.Purple40
import pl.deniotokiari.capitalgaincalculator.usecase.GetFiatAndCurrencyListBlockingUseCase

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CurrencySelector(initialCurrency: Currency? = null, onSelected: (Currency) -> Unit) {
    var currencyList: List<Currency> by rememberSaveable { mutableStateOf(emptyList()) }
    var isLoading by rememberSaveable { mutableStateOf(true) }
    var isExpanded by rememberSaveable { mutableStateOf(false) }
    var isEnabled by rememberSaveable { mutableStateOf(false) }
    var selected: Currency? by rememberSaveable { mutableStateOf(initialCurrency) }

    if (currencyList.isEmpty()) {
        val items by getKoin().get<GetFiatAndCurrencyListBlockingUseCase>()(Unit).collectAsState(
            initial = emptyList()
        )

        currencyList = items
    }

    isLoading = currencyList.isEmpty()
    isEnabled = !isLoading

    TextField(
        value = selected?.toUiString() ?: "",
        onValueChange = {},
        readOnly = true,
        trailingIcon = {
            if (isLoading) {
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
        enabled = isEnabled
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


                },
                label = { Text(text = "Search for currency") },
                singleLine = true
            )
            LazyColumn {
                val searchPattern = searchInput.lowercase()

                currencyList
                    .filter {
                        it.code.lowercase().contains(searchPattern) || it.name.lowercase().contains(searchPattern)
                    }
                    .forEach {
                        val isSelected = selected?.code == it.code

                        item {
                            Text(
                                text = it.toUiString(),
                                modifier = Modifier
                                    .clickable {
                                        selected = it
                                        onSelected(it)
                                        isExpanded = false
                                    }
                                    .fillParentMaxWidth()
                                    .padding(16.dp), color = if (isSelected) {
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