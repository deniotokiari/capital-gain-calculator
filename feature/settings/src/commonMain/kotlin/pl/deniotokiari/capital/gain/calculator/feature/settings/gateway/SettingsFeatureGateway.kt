package pl.deniotokiari.capital.gain.calculator.feature.settings.gateway

import pl.deniotokiari.capital.gain.calculator.feature.settings.data.Settings
import pl.deniotokiari.capital.gain.calculator.feature.settings.data.datasource.SettingsDataSource
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.GatewayCurrency
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGateway

class SettingsFeatureGateway(
    private val settingsDataSource: SettingsDataSource,
) : SettingsGateway {
    override suspend fun saveSettings(userId: String, currency: GatewayCurrency): Result<Unit> =
        settingsDataSource.saveSettings(Settings(userId, currency))
}
