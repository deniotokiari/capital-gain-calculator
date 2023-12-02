package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbConversionRate
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.domain.model.InstrumentWithMarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.Percent
import pl.deniotokiari.capitalgaincalculator.domain.model.PositionWithMarketData
import java.math.BigDecimal

@Factory(binds = [GetPortfolioInstrumentsWithPositionsUseCase::class])
class GetPortfolioInstrumentsWithPositionsUseCase(
    private val instrumentDao: DbInstrument.Dao,
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList,
    private val convertCurrencyValueUseCase: ConvertCurrencyValueUseCase,
    private val conversionRateDao: DbConversionRate.Dao
) : FlowUseCase<String, List<InstrumentWithMarketData>> {
    override fun invoke(params: String): Flow<List<InstrumentWithMarketData>> = conversionRateDao.rates()
        .combine(combine(
            instrumentDao.tickerPositionsByPortfolioId(params),
            instrumentDao.currencyPositionsByPortfolioId(params)
        ) { instruments, currencies ->
            instruments to currencies
        })
        { _, result ->
            val (instruments, currencies) = result
            val items = mutableListOf<InstrumentWithMarketData>()

            instruments.map { (ticker, positions) ->
                val tickerCurrency = ticker.currency.toDataModel()
                val positionsMarketData =
                    positions.map { position ->
                        val model = position.toDataModel()

                        MarketData.from(
                            spent = convertCurrencyValueUseCase(model.price to tickerCurrency).value,
                            count = position.position.count,
                            currentPrice = ticker.ticker.price,
                            currency = tickerCurrency
                        ) to model
                    }

                InstrumentWithMarketData.TickerInstrument(
                    ticker = ticker.toDataModel(),
                    instrumentId = ticker.ticker.symbol,
                    data = calculateMarketDataFromMarketDataList(
                        CalculateMarketDataFromMarketDataList.Params(
                            tickerCurrency,
                            positionsMarketData.map { (data, _) -> data }
                        )
                    ),
                    positions = positionsMarketData.map { (data, position) ->
                        PositionWithMarketData(
                            position = position,
                            data = data
                        )
                    }
                )
            }.let(items::addAll)

            currencies.map { (currency, positions) ->
                val positionsMarketData = positions.map { position ->
                    val model = position.toDataModel()

                    if (currency.code == position.currency.code) {
                        MarketData(
                            marketValue = CurrencyValue(
                                value = position.position.count,
                                currency = currency.toDataModel()
                            ),
                            gain = CurrencyValue(
                                value = BigDecimal.ZERO,
                                currency = currency.toDataModel()
                            ),
                            percent = Percent(value = BigDecimal.ZERO)
                        ) to model
                    } else {
                        MarketData.from(
                            spent = position.position.price,
                            count = position.position.count,
                            currentPrice = position.position.count * convertCurrencyValueUseCase(
                                CurrencyValue(
                                    value = BigDecimal.ONE,
                                    currency = currency.toDataModel()
                                ) to position.currency.toDataModel()
                            ).value,
                            currency = position.currency.toDataModel()
                        ) to model
                    }
                }

                InstrumentWithMarketData.CurrencyInstrument(
                    currency = currency.toDataModel(),
                    instrumentId = currency.code,
                    data = calculateMarketDataFromMarketDataList(CalculateMarketDataFromMarketDataList.Params(
                        targetCurrency = currency.toDataModel(),
                        data = positionsMarketData.map { (data, _) -> data }
                    )),
                    positions = positionsMarketData.map { (data, position) ->
                        PositionWithMarketData(
                            position = position,
                            data = data
                        )
                    }
                )
            }.let(items::addAll)

            items
        }.map { items -> items.sortedBy { it.data?.percent?.value?.let { value -> -value } } }
}