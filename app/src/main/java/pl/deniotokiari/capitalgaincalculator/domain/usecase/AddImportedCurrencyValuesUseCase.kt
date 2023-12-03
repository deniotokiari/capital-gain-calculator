package pl.deniotokiari.capitalgaincalculator.domain.usecase

import androidx.room.withTransaction
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.db.AppDataBase
import pl.deniotokiari.capitalgaincalculator.data.db.DbCurrency
import pl.deniotokiari.capitalgaincalculator.data.db.DbInstrument
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.model.Position
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository
import java.math.BigDecimal
import java.time.LocalDate

@Factory(binds = [AddImportedCurrencyValuesUseCase::class])
class AddImportedCurrencyValuesUseCase(
    private val addPositionToInstrument: AddPositionToInstrument,
    private val appDataBase: AppDataBase,
    private val currencyRepository: CurrencyRepository,
    private val instrumentDao: DbInstrument.Dao,
    private val currencyDao: DbCurrency.Dao
) : UseCase<AddImportedTickerValuesUseCase.Params, Unit> {
    override suspend fun invoke(params: AddImportedTickerValuesUseCase.Params) {
        val (map, id) = params

        appDataBase.withTransaction {
            map.forEach { (instrument, items) ->
                if (currencyDao.currencyOrNull(instrument) == null) {
                    currencyDao.addCurrencies(
                        listOf(
                            DbCurrency.Model(
                                code = instrument,
                                name = instrument,
                                type = DbCurrency.Type.Digital
                            )
                        )
                    )
                }

                instrumentDao.addInstrument(
                    DbInstrument.Model(
                        portfolioId = id,
                        id = instrument,
                        type = DbInstrument.Type.Currency
                    )
                )

                items.forEach { (date, quantity, totalAmount, currency) ->
                    val (year, month, day) = date.split(",").map { it.toInt() }

                    if (currencyDao.currencyOrNull(currency) == null) {
                        currencyDao.addCurrencies(
                            listOf(
                                DbCurrency.Model(
                                    code = currency,
                                    name = currency,
                                    type = DbCurrency.Type.Digital
                                )
                            )
                        )
                    }

                    addPositionToInstrument(
                        AddPositionToInstrument.Params(
                            instrumentId = instrument,
                            portfolioId = id,
                            position = Position(
                                count = BigDecimal(quantity),
                                price = CurrencyValue(
                                    value = BigDecimal(totalAmount),
                                    currency = currencyRepository.getByCode(currency)
                                ),
                                date = LocalDate.of(year, month, day)
                            )
                        )
                    )
                }
            }
        }
    }

    data class Params(
        val map: Map<String, List<List<String>>>,
        val portfolioId: String
    )
}