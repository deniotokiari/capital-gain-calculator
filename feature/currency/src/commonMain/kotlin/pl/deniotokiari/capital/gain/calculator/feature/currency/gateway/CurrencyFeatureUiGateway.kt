package pl.deniotokiari.capital.gain.calculator.feature.currency.gateway

import androidx.compose.runtime.Composable
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.compose.CurrenciesList
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.label
import pl.deniotokiari.capital.gain.calculator.gateway.currency.CurrencyUiGateway
import pl.deniotokiari.capital.gain.calculator.gateway.currency.GatewayCurrency

class CurrencyFeatureUiGateway : CurrencyUiGateway {
    @Composable
    override fun Currencies(
        label: String,
        initialCurrency: GatewayCurrency?,
        onCurrencyChange: (GatewayCurrency) -> Unit,
    ) =
        CurrenciesList(
            label = label,
            initialCurrency = initialCurrency?.toCurrency(),
            onCurrencyChange = { currency ->
                onCurrencyChange(currency.toGatewayCurrency())
            },
        )
}

private fun Currency.toGatewayCurrency() = GatewayCurrency(
    code = code,
    name = name,
    label = label,
)

private fun GatewayCurrency.toCurrency() = Currency.Physical(
    code = code,
    name = name,
)