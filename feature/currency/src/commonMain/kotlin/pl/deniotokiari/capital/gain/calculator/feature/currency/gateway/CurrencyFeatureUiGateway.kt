package pl.deniotokiari.capital.gain.calculator.feature.currency.gateway

import androidx.compose.runtime.Composable
import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.compose.CurrenciesList
import pl.deniotokiari.capital.gain.calculator.feature.currency.presentation.label
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyUiGateway

class CurrencyFeatureUiGateway : CurrencyUiGateway {
    @Composable
    override fun Currencies(
        label: String,
        initialCurrency: CurrencyGatewayModel?,
        onCurrencyChange: (CurrencyGatewayModel) -> Unit,
    ) =
        CurrenciesList(
            label = label,
            initialCurrency = initialCurrency?.toCurrency(),
            onCurrencyChange = { currency ->
                onCurrencyChange(currency.toGatewayCurrency())
            },
        )
}

internal fun Currency.toGatewayCurrency() = CurrencyGatewayModel(
    code = code,
    name = name,
    label = label,
)

internal fun CurrencyGatewayModel.toCurrency() = Currency.Physical(
    code = code,
    name = name,
)
