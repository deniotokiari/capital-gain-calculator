package pl.deniotokiari.capital.gain.calculator.gateway.feature.currency

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

interface CurrencyUiGateway {
    @Composable
    fun Currencies(
        label: String,
        modifier: Modifier,
        initialCurrency: CurrencyGatewayModel?,
        onCurrencyChange: (CurrencyGatewayModel) -> Unit,
    )
}
