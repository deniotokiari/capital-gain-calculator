package pl.deniotokiari.capital.gain.calculator.gateway.domain.usecase

import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.CurrencyGateway
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.GatewayCurrency
import pl.deniotokiari.core.misc.usecase.UseCase

class GetUsdCurrencyUseCase(
    private val currencyGateway: CurrencyGateway,
) : UseCase<Unit, GatewayCurrency?> {
    override suspend fun invoke(input: Unit): GatewayCurrency? = currencyGateway.getUsdCurrency()
}
