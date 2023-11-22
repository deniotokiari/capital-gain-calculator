package pl.deniotokiari.capitalgaincalculator.domain.usecase

import androidx.room.withTransaction
import kotlinx.coroutines.withContext
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.AppDispatchers
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.core.fold
import pl.deniotokiari.capitalgaincalculator.data.db.AppDataBase
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.db.DbTicker
import pl.deniotokiari.capitalgaincalculator.data.db.toDbModel
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository
import pl.deniotokiari.capitalgaincalculator.data.repository.TickerRepository
import java.math.BigDecimal

@Factory(binds = [AddTickerToPortfolioUseCase::class])
class AddTickerToPortfolioUseCase(
    private val tickerDao: DbTicker.Dao,
    private val instrumentDao: DbInstrument.Dao,
    private val appDispatchers: AppDispatchers,
    private val currencyRepository: CurrencyRepository,
    private val appDataBase: AppDataBase,
    private val tickerRepository: TickerRepository
) : UseCase<AddTickerToPortfolioUseCase.Params, Unit> {
    override suspend fun invoke(params: Params) = withContext(appDispatchers.io) {
        val currency = currencyRepository.getByCode(params.ticker.currency)
        val price = tickerRepository.price(params.ticker.symbol).fold(
            success = { it.value },
            failed = { null }
        )

        appDataBase.withTransaction {
            tickerDao.addTicker(
                params.ticker.toDbModel(
                    currency = currency,
                    price = price ?: BigDecimal.ZERO
                )
            )
            instrumentDao.addInstrument(
                DbInstrument.Model(
                    portfolioId = params.portfolioId,
                    id = params.ticker.symbol,
                    type = DbInstrument.Type.Ticker
                )
            )
        }
    }

    data class Params(
        val ticker: Ticker.Search,
        val portfolioId: String
    )
}