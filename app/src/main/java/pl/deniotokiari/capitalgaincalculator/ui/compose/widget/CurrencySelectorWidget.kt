@file:OptIn(ExperimentalMaterial3Api::class)

package pl.deniotokiari.capitalgaincalculator.ui.compose.widget

import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.PressInteraction
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.CurrencySelectorViewModel

@Composable
fun CurrencySelectorWidget(
    selectedCurrency: Currency?,
    title: String,
    onCurrencySelected: (Currency) -> Unit,
    viewModel: CurrencySelectorViewModel = koinViewModel()
) {
    val state by viewModel.uiState.collectAsState()
    var isExpanded by remember { mutableStateOf(false) }

    OutlinedTextField(
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
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = 2.dp),
        placeholder = { Text(text = title) },
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
            CurrenciesListWithSearchWidget(
                onCurrencySelected = {
                    viewModel.onSelectedCurrencyChange(it)
                    onCurrencySelected(it)
                    isExpanded = false
                },
                viewModel = viewModel
            )
        }
    }
}