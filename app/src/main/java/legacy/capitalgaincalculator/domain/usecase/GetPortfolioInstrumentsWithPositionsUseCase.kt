package legacy.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import legacy.capitalgaincalculator.core.FlowUseCase
import legacy.capitalgaincalculator.data.db.DbConversionRate
import legacy.capitalgaincalculator.data.db.DbInstrument
import legacy.capitalgaincalculator.data.db.DbPortfolio
import legacy.capitalgaincalculator.domain.model.InstrumentWithMarketData
import org.koin.core.annotation.Factory

@Factory(binds = [GetPortfolioInstrumentsWithPositionsUseCase::class])
class GetPortfolioInstrumentsWithPositionsUseCase(
    private val instrumentDao: DbInstrument.Dao,
    private val calculateMarketDataFromMarketDataList: CalculateMarketDataFromMarketDataList,
    private val convertCurrencyValueUseCase: ConvertCurrencyValueUseCase,
    private val conversionRateDao: DbConversionRate.Dao,
    private val portfolioDao: DbPortfolio.Dao,
) : FlowUseCase<String, List<InstrumentWithMarketData>> {
    override fun invoke(params: String): Flow<List<InstrumentWithMarketData>> = TODO()
}