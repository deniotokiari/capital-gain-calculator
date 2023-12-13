package pl.deniotokiari.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.UseCase
import pl.deniotokiari.data.profile.repository.ProfileRepository

@Factory(binds = [SetProfileCurrencyUseCase::class])
class SetProfileCurrencyUseCase(
    private val profileRepository: ProfileRepository
) : UseCase<String, Unit> {
    override suspend fun invoke(params: String) {
        profileRepository.setProfileCurrency(params)
    }
}