package pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.usecase

import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGateway
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGatewayModel
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import pl.deniotokiari.core.misc.usecase.UseCase

class SaveSettingsUseCase(
    private val settingsGateway: SettingsGateway,
) : UseCase<SettingsGatewayModel, Result<Unit, Exception>> {
    override suspend fun invoke(input: SettingsGatewayModel): Result<Unit, Exception> = settingsGateway
        .saveSettings(input)
        .fold(
            onSuccess = {
                Unit.ok()
            },
            onFailure = {
                Exception(it.message).error()
            },
        )
}
