package pl.deniotokiari.capital.gain.calculator.gateway.feature.settings

import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.GatewayCurrency

interface SettingsGateway {
    suspend fun saveSettings(userId: String, currency: GatewayCurrency): Result<Unit>
}
