package pl.deniotokiari.capital.gain.calculator.gateway.domain.usecase

import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.GatewayCurrency
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGateway
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import pl.deniotokiari.core.misc.usecase.UseCase

class SaveSettingsUseCase(
    private val settingsGateway: SettingsGateway,
) : UseCase<SaveSettingsUseCase.Params, Result<Unit, Exception>> {
    override suspend fun invoke(input: Params): Result<Unit, Exception> {
        val currency = input
            .currency
            ?: return Exception("Currency cannot be null").error()

        return settingsGateway
            .saveSettings(userId = input.userId, currency = currency)
            .fold(
                onSuccess = { Unit.ok() },
                onFailure = { Exception(it).error() },
            )
    }

    data class Params(
        val userId: String,
        val currency: GatewayCurrency?,
    )
}