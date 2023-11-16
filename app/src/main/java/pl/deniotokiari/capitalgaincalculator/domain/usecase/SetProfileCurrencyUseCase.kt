package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.repository.ProfileRepository

@Factory(binds = [SetProfileCurrencyUseCase::class])
class SetProfileCurrencyUseCase(
    private val profileRepository: ProfileRepository
) : UseCase<Currency, Unit> {
    override suspend fun invoke(params: Currency) {
        profileRepository.setProfileCurrency(params)
    }
}