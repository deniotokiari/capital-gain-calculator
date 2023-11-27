package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.repository.CurrencyRepository

@Factory(binds = [UpdateConversionRatesUseCase::class])
class UpdateConversionRatesUseCase(
    private val currencyRepository: CurrencyRepository
) : UseCase<Unit, Result<Unit, DataError>> {
    override suspend fun invoke(params: Unit): Result<Unit, DataError> = currencyRepository.updateConversionRates()
}