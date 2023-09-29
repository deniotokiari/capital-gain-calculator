package pl.deniotokiari.capitalgaincalculator.usecase

import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.feature.profile.ProfileRepository

class SetProfileCurrencyUseCase(
    private val profileRepository: ProfileRepository,
    private val getCurrencyByCodeUseCase: GetCurrencyByCodeUseCase
) : UseCase<String, Unit> {
    override suspend fun invoke(params: String) {
        profileRepository.setProfileCurrency(getCurrencyByCodeUseCase(params))
    }
}