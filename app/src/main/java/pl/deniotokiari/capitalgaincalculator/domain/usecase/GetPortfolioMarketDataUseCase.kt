package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.DbPosition
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.Percent
import java.math.BigDecimal

@Factory(binds = [GetPortfolioMarketDataUseCase::class])
class GetPortfolioMarketDataUseCase(
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList,
    private val positionDao: DbPosition.Dao,
    private val portfolioDao: DbPortfolio.Dao,
    private val convertCurrencyValueUseCase: ConvertCurrencyValueUseCase
) : UseCase<String, MarketData?> {
    override suspend fun invoke(params: String): MarketData? {
        val portfolio = portfolioDao.getPortfolioByName(params)?.toDataModel() ?: return null
        val positions = positionDao.positionsByPortfolio(params)

        return calculateMarketDataFromMarketDataList(
            CalculateMarketDataFromMarketDataList.Params(
                targetCurrency = portfolio.currency,
                data = positions.mapNotNull { (position, currency, tickerPosition, currencyPosition) ->
                    when {
                        tickerPosition != null -> {
                            MarketData.from(
                                spent = convertCurrencyValueUseCase(
                                    CurrencyValue(
                                        value = position.price,
                                        currency = currency.toDataModel()
                                    ) to tickerPosition.currency.toDataModel()
                                ).value,
                                count = position.count,
                                currentPrice = tickerPosition.ticker.price,
                                currency = tickerPosition.currency.toDataModel(),
                            )
                        }

                        currencyPosition != null -> {
                            if (currencyPosition.code == position.currencyCode) {
                                MarketData(
                                    marketValue = CurrencyValue(
                                        value = position.count,
                                        currency = currency.toDataModel()
                                    ),
                                    gain = CurrencyValue(
                                        value = BigDecimal.ZERO,
                                        currency = currency.toDataModel()
                                    ),
                                    percent = Percent(value = BigDecimal.ZERO)
                                )
                            } else {
                                MarketData.from(
                                    spent = position.price,
                                    count = position.count,
                                    currentPrice = convertCurrencyValueUseCase(
                                        CurrencyValue(
                                            value = BigDecimal.ONE,
                                            currency = currencyPosition.toDataModel()
                                        ) to currency.toDataModel()
                                    ).value,
                                    currency = currency.toDataModel()
                                )
                            }
                        }

                        else -> null
                    }
                }
            )
        )
    }
}
