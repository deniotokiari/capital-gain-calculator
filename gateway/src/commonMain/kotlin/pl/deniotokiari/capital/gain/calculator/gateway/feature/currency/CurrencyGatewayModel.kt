package pl.deniotokiari.capital.gain.calculator.gateway.feature.currency

import kotlinx.serialization.Serializable

@Serializable
data class CurrencyGatewayModel(
    val code: String,
    val name: String,
    val label: String,
)
