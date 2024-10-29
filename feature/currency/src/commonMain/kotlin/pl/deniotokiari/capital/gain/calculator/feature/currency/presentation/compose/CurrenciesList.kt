package pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.compose

import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Icon
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AccountCircle
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Warning
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_currency
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListUiState
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.CurrenciesListViewModel
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isEnabled
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isError
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.isLoading
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun CurrenciesList() {
    val viewModel = koinViewModel<CurrenciesListViewModel>()
    val uiState by viewModel.uiState.collectAsState()

    CurrenciesListContent(uiState = uiState)
}

@Composable
fun CurrenciesListContent(
    uiState: CurrenciesListUiState,
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
                )
            }
        }

        else -> null
    }

    OutlinedTextField(
        label = { Text(stringResource(Res.string.ui_kit_currency)) },
        enabled = uiState.isEnabled,
        isError = uiState.isError,
        value = "",
        onValueChange = {},
        leadingIcon = leadingIcon,
        trailingIcon = trailingIcon,
    )
}