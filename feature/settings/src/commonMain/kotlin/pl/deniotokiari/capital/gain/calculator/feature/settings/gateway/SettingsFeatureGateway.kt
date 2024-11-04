package pl.deniotokiari.capital.gain.calculator.feature.settings.gateway

import pl.deniotokiari.capital.gain.calculator.feature.settings.data.datasource.SettingsDataSource
import pl.deniotokiari.capital.gain.calculator.feature.settings.data.toSettings
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGateway
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGatewayModel
import pl.deniotokiari.core.misc.Result

class SettingsFeatureGateway(
    private val settingsDataSource: SettingsDataSource,
) : SettingsGateway {
    override suspend fun saveSettings(settings: SettingsGatewayModel): Result<Unit, Exception> =
        settingsDataSource.saveSettings(settings.toSettings())
}
