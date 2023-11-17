package pl.deniotokiari.capitalgaincalculator.domain.usecase

import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.UseCase
import pl.deniotokiari.capitalgaincalculator.data.repository.ProfileRepository

@Factory(binds = [IsProfileHasCurrencyUseCase::class])
class IsProfileHasCurrencyUseCase(
    private val profileRepository: ProfileRepository
) : UseCase<Unit, Boolean> {
    override suspend fun invoke(params: Unit): Boolean = profileRepository.hasCurrency()
}