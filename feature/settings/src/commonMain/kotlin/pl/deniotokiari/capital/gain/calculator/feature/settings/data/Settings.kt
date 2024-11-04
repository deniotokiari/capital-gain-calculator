package pl.deniotokiari.capital.gain.calculator.feature.settings.data

import kotlinx.serialization.Serializable
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGatewayModel

@Serializable
data class Settings(
    val settings: SettingsHolder,
) {
    @Serializable
    data class SettingsHolder(
        val profileCurrency: CurrencyGatewayModel,
    )
}

fun SettingsGatewayModel.toSettings() = Settings(
    settings = Settings.SettingsHolder(
        profileCurrency = profileCurrency,
    ),
)
