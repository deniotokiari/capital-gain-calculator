package pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.usecase

import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGateway
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGatewayModel
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import pl.deniotokiari.core.misc.usecase.UseCase

class GetUsdCurrencyUseCase(
    private val currencyGateway: CurrencyGateway,
) : UseCase<Unit, Result<CurrencyGatewayModel, Exception>> {
    override suspend fun invoke(input: Unit): Result<CurrencyGatewayModel, Exception> = currencyGateway
        .getUsdCurrency()
        ?.ok()
        ?: Exception("Currency not found").error()
}
