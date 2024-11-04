package pl.deniotokiari.capital.gain.calculator.feature.settings.data

import kotlinx.serialization.Serializable
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGatewayModel

@Serializable
data class SettingsHolder(
    val settings: Settings,
) {
    @Serializable
    data class Settings(
        val profileCurrency: CurrencyGatewayModel,
    )
}

fun SettingsGatewayModel.toSettings() = SettingsHolder(
    settings = SettingsHolder.Settings(
        profileCurrency = profileCurrency,
    ),
)
