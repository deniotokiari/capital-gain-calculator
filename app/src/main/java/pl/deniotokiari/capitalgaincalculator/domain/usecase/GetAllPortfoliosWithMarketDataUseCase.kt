package pl.deniotokiari.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.repository.PortfolioRepository
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.domain.model.Percent
import pl.deniotokiari.capitalgaincalculator.domain.model.PortfolioWithMarketData
import java.math.BigDecimal
import kotlin.random.Random

@Factory(binds = [GetAllPortfoliosWithMarketDataUseCase::class])
class GetAllPortfoliosWithMarketDataUseCase(
    private val portfolioRepository: PortfolioRepository
) : FlowUseCase<Unit, List<PortfolioWithMarketData>> {
    override fun invoke(params: Unit): Flow<List<PortfolioWithMarketData>> = flow {
        while (true) {
            val items = mutableListOf<PortfolioWithMarketData>()

            repeat(100) {
                items.add(
                    PortfolioWithMarketData(
                        name = "Test $it",
                        data = MarketData(
                            marketValue = CurrencyValue(
                                BigDecimal.valueOf(Random.nextDouble(0.0, 10_000.0)),
                                Currency("USD", Currency.Code("USD"), type = Currency.Type.Physical)
                            ),
                            gain = CurrencyValue(
                                BigDecimal.valueOf(Random.nextDouble(-10_000.0, 10_000.0)),
                                Currency("USD", Currency.Code("USD"), type = Currency.Type.Physical)
                            ),
                            percent = Percent(BigDecimal.valueOf(Random.nextDouble(-1000.0, 1000.0)))
                        )
                    )
                )
            }

            emit(items)

            delay(30 * 1000L)
        }

    }/*portfolioRepository.portfolios().map {
        it.map { item ->
            PortfolioWithMarketData(
                name = item.name,
                data =
            )
        }
    }*/
}