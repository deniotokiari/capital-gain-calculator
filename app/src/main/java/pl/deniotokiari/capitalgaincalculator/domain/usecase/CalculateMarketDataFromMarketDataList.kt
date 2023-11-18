package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.Percent
import java.math.BigDecimal

@Factory
class CalculateMarketDataFromMarketDataList : UseCase<List<MarketData>, MarketData?> {
    override suspend fun invoke(params: List<MarketData>): MarketData? {
        if (params.isEmpty()) {
            return null
        }

        var market = BigDecimal.ZERO
        var gain = BigDecimal.ZERO

        for (item in params) {
            market += item.marketValue.value
            gain += item.gain.value
        }

        return MarketData(
            marketValue = CurrencyValue(
                value = market,
                currency = params.first().marketValue.currency
            ),
            gain = CurrencyValue(
                value = gain,
                currency = params.first().gain.currency
            ),
            percent = Percent.fromMarketAndGainValues(market = market, gain = gain)
        )
    }
}