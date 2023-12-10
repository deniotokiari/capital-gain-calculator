package legacy.capitalgaincalculator.domain.usecase

import legacy.capitalgaincalculator.core.UseCase
import legacy.capitalgaincalculator.domain.model.MarketData
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.gainWithCurrency
import pl.deniotokiari.capitalgaincalculator.domain.model.valueWithCurrency

@Factory(binds = [CalculateMarketDataFromMarketDataList::class])
class CalculateMarketDataFromMarketDataList(
    private val convertCurrencyValueUseCase: ConvertCurrencyValueUseCase
) : UseCase<CalculateMarketDataFromMarketDataList.Params, MarketData?> {
    override suspend fun invoke(params: Params): MarketData? {
        var result: MarketData? = null

        for (i in 0 until params.data.size) {
            val item = params.data[i]

            item.copy(
                value = convertCurrencyValueUseCase(item.valueWithCurrency to params.targetCurrency),
                gain = item.gainWithCurrency?.let { convertCurrencyValueUseCase(it to params.targetCurrency) },
                currency = params.targetCurrency
            ).let {
                result = if (result == null) {
                    it
                } else {
                    requireNotNull(result) + it
                }
            }
        }

        return result
    }

    data class Params(
        val targetCurrency: Currency,
        val data: List<MarketData>
    )
}