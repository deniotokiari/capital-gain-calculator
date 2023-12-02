package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.model.Currency

@Factory(binds = [AddCurrencyToPortfolioUseCase::class])
class AddCurrencyToPortfolioUseCase(
    private val instrumentDao: DbInstrument.Dao
) : UseCase<AddCurrencyToPortfolioUseCase.Params, Unit> {
    override suspend fun invoke(params: Params) {
        instrumentDao.addInstrument(
            DbInstrument.Model(
                portfolioId = params.portfolioId,
                id = params.currency.code.value,
                type = DbInstrument.Type.Currency
            )
        )
    }

    data class Params(
        val currency: Currency,
        val portfolioId: String
    )
}