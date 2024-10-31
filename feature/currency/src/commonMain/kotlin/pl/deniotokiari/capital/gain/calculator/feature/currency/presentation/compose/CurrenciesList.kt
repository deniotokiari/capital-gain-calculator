package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.compose

import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.FocusInteraction
import androidx.compose.foundation.interaction.Interaction
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Icon
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_currency
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_empty_currencies
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_search_currency
import kotlinx.coroutines.channels.BufferOverflow
import kotlinx.coroutines.flow.MutableSharedFlow
import org.koin.compose.viewmodel.koinViewModel
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListAction
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListUiState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListViewModel
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.ItemsBottomSheetState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.currentCurrencyLabel
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isEnabled
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isError
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isLoading
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.itemsBottomSheetState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.label
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun CurrenciesList(
    label: String = stringResource(Res.string.ui_kit_currency),
    initialCurrency: Currency? = null,
    onCurrencyChange: (Currency) -> Unit,
) {
    val viewModel = koinViewModel<CurrenciesListViewModel> {
        parametersOf(initialCurrency)
    }
    val uiState by viewModel.uiState.collectAsState()

    CurrenciesListContent(
        label = label,
        uiState = uiState,
        onAction = { action ->
            viewModel.onAction(action)

            if (action is CurrenciesListAction.CurrencyClicked) {
                onCurrencyChange(action.currency)
            }
        })
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CurrenciesListContent(
    label: String = stringResource(Res.string.ui_kit_currency),
    uiState: CurrenciesListUiState,
    onAction: (CurrenciesListAction) -> Unit,
) {
    val leadingIcon: @Composable (() -> Unit)? = when {
        uiState.isError -> {
            {
                Icon(
                    imageVector = Icons.Default.Refresh,
                    contentDescription = null,
                )
            }
        }

        else -> null
    }
    val trailingIcon: @Composable (() -> Unit) = when {
        uiState.isError -> {
            {
                Icon(
                    imageVector = Icons.Default.Warning,
                    contentDescription = null,
                )
            }
        }

        uiState.isLoading -> {
            {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    strokeWidth = 2.dp,
                )
            }
        }

        else -> {
            {
                Icon(
                    imageVector = Icons.Default.ArrowDropDown,
                    contentDescription = null,
                    modifier = Modifier.rotate(
                        if (uiState.itemsBottomSheetState != null) 180f else 0f
                    ),
                )
            }
        }
    }
    val interactionSource = remember {
        object : MutableInteractionSource {
            override val interactions = MutableSharedFlow<Interaction>(
                extraBufferCapacity = 16,
                onBufferOverflow = BufferOverflow.DROP_OLDEST,
            )

            override suspend fun emit(interaction: Interaction) {
                if (interaction is FocusInteraction.Focus) {
                    onAction(CurrenciesListAction.FieldClicked)
                }

                interactions.emit(interaction)
            }

            override fun tryEmit(interaction: Interaction): Boolean {
                return interactions.tryEmit(interaction)
            }
        }
    }

    val focusManager = LocalFocusManager.current

    OutlinedTextField(
        modifier = Modifier
            .width(OutlinedTextFieldDefaults.MinWidth)
            .clickable { onAction(CurrenciesListAction.FieldClicked) },
        label = { Text(label) },
        enabled = uiState.isEnabled,
        isError = uiState.isError,
        value = uiState.currentCurrencyLabel,
        onValueChange = {},
        leadingIcon = leadingIcon,
        trailingIcon = trailingIcon,
        readOnly = true,
        singleLine = true,
        interactionSource = interactionSource,
    )

    uiState.itemsBottomSheetState?.let { itemsBottomSheetState ->
        val sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = false)

        ModalBottomSheet(
            sheetState = sheetState,
            onDismissRequest = {
                onAction(CurrenciesListAction.ItemsBottomSheetDismissed)
            },
        ) {
            Currencies(
                currentLabel = uiState.currentCurrencyLabel,
                state = itemsBottomSheetState,
                onAction = onAction,
            )
        }
    } ?: focusManager.clearFocus()
}

@Composable
fun Currencies(
    currentLabel: String? = null,
    state: ItemsBottomSheetState,
    onAction: (CurrenciesListAction) -> Unit,
) {
    if (state.currencies.isEmpty() && state.searchValue.isEmpty()) {
        Text(
            modifier = Modifier.padding(32.dp).fillMaxWidth(),
            textAlign = TextAlign.Center,
            text = stringResource(Res.string.ui_kit_empty_currencies),
        )
    } else {
        Column(
            modifier = Modifier.padding(16.dp).fillMaxWidth(),
        ) {
            OutlinedTextField(
                modifier = Modifier.padding(vertical = 4.dp).padding(bottom = 4.dp).fillMaxWidth(),
                label = { Text(stringResource(Res.string.ui_kit_search_currency)) },
                value = state.searchValue,
                onValueChange = { onAction(CurrenciesListAction.CurrencySearchValueChange(it)) },
            )

            if (state.currencies.isEmpty()) {
                Text(
                    modifier = Modifier.padding(32.dp).fillMaxWidth(),
                    textAlign = TextAlign.Center,
                    text = stringResource(Res.string.ui_kit_empty_currencies),
                )
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxWidth(),
                ) {
                    state.currencies.forEach { currency ->
                        item(key = currency.code) {
                            Text(
                                modifier = Modifier.fillMaxWidth().padding(vertical = 8.dp)
                                    .clickable {
                                        onAction(
                                            CurrenciesListAction.CurrencyClicked(
                                                currency,
                                            )
                                        )
                                    },
                                text = currency.label,
                                color = if (currency.label == currentLabel) {
                                    androidx.compose.material.MaterialTheme.colors.primary
                                } else {
                                    androidx.compose.material.MaterialTheme.colors.onSurface
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}