package pl.deniotokiari.capitalgaincalculator.domain.usecase

import androidx.room.withTransaction
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.db.AppDataBase
import pl.deniotokiari.capitalgaincalculator.data.db.DbConversionRate
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.db.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.data.db.DbPosition
import pl.deniotokiari.capitalgaincalculator.data.db.DbTicker

@Factory(binds = [DeletePortfolioUseCase::class])
class DeletePortfolioUseCase(
    private val appDatabase: AppDataBase,
    private val positionDao: DbPosition.Dao,
    private val instrumentDao: DbInstrument.Dao,
    private val tickerDao: DbTicker.Dao,
    private val portfolioDao: DbPortfolio.Dao,
    private val conversionRateDao: DbConversionRate.Dao
) : UseCase<String, Unit> {
    override suspend fun invoke(params: String) {
        appDatabase.withTransaction {
            // positions
            positionDao.deleteByPortfolio(params)
            // instruments
            instrumentDao.deleteByPortfolio(params)
            // tickers
            tickerDao.delete(tickerDao.tickersWithoutInstrument())
            // portfolio
            portfolioDao.deleteByName(params)
            // currencies
            conversionRateDao.deleteRates(conversionRateDao.getUnusedRates())
        }
    }
}