package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.DbPosition
import pl.deniotokiari.capitalgaincalculator.data.db.toDataModel
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData

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
                data = positions.map { (position, currency, ticker) ->
                    MarketData.from(
                        spent = convertCurrencyValueUseCase(
                            CurrencyValue(
                                value = position.price,
                                currency = currency.toDataModel()
                            ) to ticker.currency.toDataModel()
                        ).value,
                        count = position.count,
                        currentPrice = ticker.ticker.price,
                        currency = ticker.currency.toDataModel()
                    )
                }
            )
        )
    }
}
