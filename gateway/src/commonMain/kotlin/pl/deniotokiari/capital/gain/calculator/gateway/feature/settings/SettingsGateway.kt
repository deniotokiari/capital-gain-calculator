package pl.deniotokiari.capital.gain.calculator.gateway.feature.settings

import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel
import pl.deniotokiari.core.misc.Result

interface SettingsGateway {
    suspend fun saveSettings(settings: SettingsGatewayModel): Result<Unit, Exception>

    suspend fun getProfileCurrency(): Result<CurrencyGatewayModel, Exception>
}
