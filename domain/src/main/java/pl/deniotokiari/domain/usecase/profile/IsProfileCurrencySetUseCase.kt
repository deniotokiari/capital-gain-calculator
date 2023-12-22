package pl.deniotokiari.domain.usecase.profile

import org.koin.core.annotation.Factory
import pl.deniotokiari.core.common.UseCase
import pl.deniotokiari.data.profile.repository.ProfileRepository

@Factory(binds = [IsProfileCurrencySetUseCase::class])
class IsProfileCurrencySetUseCase(
    private val profileRepository: ProfileRepository
) : UseCase<Unit, Boolean> {
    override suspend fun invoke(params: Unit): Boolean = profileRepository.isProfileCurrencySet()
}