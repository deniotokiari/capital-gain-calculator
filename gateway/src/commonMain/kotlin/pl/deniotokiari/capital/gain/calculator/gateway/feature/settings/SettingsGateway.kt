package pl.deniotokiari.capital.gain.calculator.gateway.feature.settings

interface SettingsGateway {
    suspend fun saveSettings(settings: SettingsGatewayModel): Result<Unit>
}
