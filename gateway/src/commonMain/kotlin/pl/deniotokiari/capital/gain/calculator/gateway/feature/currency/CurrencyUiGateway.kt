package pl.deniotokiari.capital.gain.calculator.gateway.feature.currency

import androidx.compose.runtime.Composable

interface CurrencyUiGateway {
    @Composable
    fun Currencies(
        label: String,
        initialCurrency: GatewayCurrency?,
        onCurrencyChange: (GatewayCurrency) -> Unit,
    )
}