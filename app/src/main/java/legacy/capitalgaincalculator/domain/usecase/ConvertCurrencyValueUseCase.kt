package legacy.capitalgaincalculator.domain.usecase

import legacy.capitalgaincalculator.core.UseCase
import legacy.capitalgaincalculator.data.repository.CurrencyRepository
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository
import java.math.BigDecimal

@Factory(binds = [ConvertCurrencyValueUseCase::class])
class ConvertCurrencyValueUseCase(
    private val currencyRepository: CurrencyRepository
) : UseCase<Pair<CurrencyValue, Currency>, BigDecimal> {
    override suspend fun invoke(params: Pair<CurrencyValue, Currency>): BigDecimal {
        val (from, to) = params

        return if (from.currency.code.value == to.code.value) {
            from.value
        } else {
            val rate = currencyRepository.conversionRate(from = from.currency, to = to)

            from.value * rate
        }
    }
}