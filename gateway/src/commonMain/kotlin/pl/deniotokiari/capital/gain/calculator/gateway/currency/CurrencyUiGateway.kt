package pl.deniotokiari.capital.gain.calculator.gateway.currency

import androidx.compose.runtime.Composable

interface CurrencyUiGateway {
    @Composable
    fun Currencies(
        onCurrencyChange: (GatewayCurrency) -> Unit,
    )
}