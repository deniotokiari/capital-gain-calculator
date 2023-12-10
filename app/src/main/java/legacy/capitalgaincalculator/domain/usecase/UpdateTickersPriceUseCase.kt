package legacy.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbTicker
import pl.deniotokiari.capitalgaincalculator.data.repository.TickerRepository

@Factory(binds = [UpdateTickersPriceUseCase::class])
class UpdateTickersPriceUseCase(
    private val tickerRepository: TickerRepository,
    private val tickerDao: DbTicker.Dao
) : UseCase<Unit, Unit> {
    override suspend fun invoke(params: Unit) {
        val tickers = tickerDao.tickers()

        tickers.forEach { ticker ->
            tickerRepository.updatePrice(ticker)
        }
    }
}