package pl.deniotokiari.capital.gain.calculator.gateway.feature.currency

interface CurrencyGateway {
    suspend fun getUsdCurrency(): CurrencyGatewayModel?
}
