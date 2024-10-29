package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.compose

import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.Interaction
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.PressInteraction
import androidx.compose.foundation.layout.size
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Icon
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Warning
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_currency
import kotlinx.coroutines.channels.BufferOverflow
import kotlinx.coroutines.flow.MutableSharedFlow
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListAction
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListUiState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListViewModel
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.currentCurrency
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isEnabled
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isError
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isLoading
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.showItems
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun CurrenciesList() {
    val viewModel = koinViewModel<CurrenciesListViewModel>()
    val uiState by viewModel.uiState.collectAsState()

    CurrenciesListContent(
        uiState = uiState,
        onAction = { action ->
            viewModel.onAction(action)
        }
    )
}

@Composable
fun CurrenciesListContent(
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
    val trailingIcon: @Composable (() -> Unit)? = when {
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
                        if (uiState.showItems) 180f else 0f
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
                if (interaction is PressInteraction.Release) {
                    onAction(CurrenciesListAction.FieldClicked)
                }

                interactions.emit(interaction)
            }

            override fun tryEmit(interaction: Interaction): Boolean {
                return interactions.tryEmit(interaction)
            }
        }
    }

    OutlinedTextField(
        modifier = Modifier.clickable {
            onAction(CurrenciesListAction.FieldClicked)
        },
        label = { Text(stringResource(Res.string.ui_kit_currency)) },
        enabled = uiState.isEnabled,
        isError = uiState.isError,
        value = uiState.currentCurrency,
        onValueChange = {},
        leadingIcon = leadingIcon,
        trailingIcon = trailingIcon,
        readOnly = true,
        interactionSource = interactionSource,
    )
}