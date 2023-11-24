package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository

@Factory(binds = [ConvertCurrencyValueUseCase::class])
class ConvertCurrencyValueUseCase(
    private val currencyRepository: CurrencyRepository
) : UseCase<Pair<CurrencyValue, Currency>, CurrencyValue> {
    override suspend fun invoke(params: Pair<CurrencyValue, Currency>): CurrencyValue {
        val (from, to) = params

        return if (from.currency.code.value == to.code.value) {
            from
        } else {
            val rate = currencyRepository.conversionRate(from = from.currency, to = to)

            CurrencyValue(
                value = from.value * rate,
                currency = to
            )
        }
    }
}