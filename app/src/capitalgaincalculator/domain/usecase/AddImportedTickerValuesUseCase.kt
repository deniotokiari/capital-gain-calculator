package legacy.capitalgaincalculator.domain.usecase

import legacy.capitalgaincalculator.core.UseCase
import legacy.capitalgaincalculator.data.model.CurrencyValue
import legacy.capitalgaincalculator.data.repository.CurrencyRepository
import legacy.capitalgaincalculator.ui.navigation.AppHostNavigation
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.model.Position
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation
import java.math.BigDecimal
import java.time.LocalDate

@Factory(binds = [AddImportedTickerValuesUseCase::class])
class AddImportedTickerValuesUseCase(
    private val appHostNavigation: AppHostNavigation,
    private val addTickerToPortfolioUseCase: AddTickerToPortfolioUseCase,
    private val addPositionToInstrument: AddPositionToInstrument,
    private val currencyRepository: CurrencyRepository
) : UseCase<AddImportedTickerValuesUseCase.Params, Unit> {
    override suspend fun invoke(params: Params) = runCatching {
        val (map, id) = params

        map.forEach { (ticker, items) ->
            val tickerResult = appHostNavigation.navigateToTickerSearch(ticker)

            if (tickerResult != null) {
                addTickerToPortfolioUseCase(
                    AddTickerToPortfolioUseCase.Params(
                        ticker = tickerResult,
                        portfolioId = id
                    )
                )

                items.forEach { (date, quantity, totalAmount, currency) ->
                    val (year, month, day) = date.split(",").map { it.toInt() }

                    addPositionToInstrument(
                        AddPositionToInstrument.Params(
                            instrumentId = tickerResult.symbol,
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
    }.fold(
        onSuccess = { },
        onFailure = { }
    )

    data class Params(
        val map: Map<String, List<List<String>>>,
        val portfolioId: String
    )
}