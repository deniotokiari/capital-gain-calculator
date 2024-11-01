package pl.deniotokiari.capital.gain.calculator.feature.currency.gateway

import pl.deniotokiari.capital.gain.calculator.feature.currency.data.model.Currency
import pl.deniotokiari.capital.gain.calculator.feature.currency.domain.usecase.GetCurrenciesUseCase
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGateway
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.GatewayCurrency
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok

class CurrencyFeatureGateway(
    private val getCurrenciesUseCase: GetCurrenciesUseCase,
) : CurrencyGateway {
    override suspend fun getUsdCurrency(): GatewayCurrency? =
        getCurrenciesUseCase(Unit).then { items ->
            items
                .firstOrNull { currency -> currency.isUsd() }
                ?.ok()
                ?: Exception("No USD currency found").error()
        }
            .getOrNull()
            ?.toGatewayCurrency()
}

private fun Currency.isUsd() = code.lowercase() == "usd"
