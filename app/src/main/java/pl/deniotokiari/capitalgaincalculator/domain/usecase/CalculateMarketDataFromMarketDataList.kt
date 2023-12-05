package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.Percent
import java.math.BigDecimal

@Factory(binds = [CalculateMarketDataFromMarketDataList::class])
class CalculateMarketDataFromMarketDataList(
    private val convertCurrencyValueUseCase: ConvertCurrencyValueUseCase
) : UseCase<CalculateMarketDataFromMarketDataList.Params, MarketData?> {
    override suspend fun invoke(params: Params): MarketData? {
        if (params.data.isEmpty()) {
            return null
        }

        var market = BigDecimal.ZERO
        var gain = BigDecimal.ZERO

        val isCash = params.data.all { it.isCash }

        for (item in params.data) {
            market += convertCurrencyValueUseCase(item.marketValue to params.targetCurrency).value

            if (!isCash) {
                gain += convertCurrencyValueUseCase(item.gain to params.targetCurrency).value
            }
        }

        return MarketData(
            marketValue = CurrencyValue(
                value = market,
                currency = params.targetCurrency
            ),
            gain = CurrencyValue(
                value = gain,
                currency = params.targetCurrency
            ),
            percent = Percent.fromMarketAndGainValues(market = market, gain = gain)
        )
    }

    data class Params(
        val targetCurrency: Currency,
        val data: List<MarketData>
    )
}