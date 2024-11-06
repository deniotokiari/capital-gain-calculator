package pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.usecase

import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.settings.SettingsGateway
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.usecase.UseCase

class GetProfileCurrencyUseCase(
    private val settingsGateway: SettingsGateway,
) : UseCase<Unit, Result<CurrencyGatewayModel, Exception>> {
    override suspend fun invoke(input: Unit): Result<CurrencyGatewayModel, Exception> =
        settingsGateway.getProfileCurrency()
}
