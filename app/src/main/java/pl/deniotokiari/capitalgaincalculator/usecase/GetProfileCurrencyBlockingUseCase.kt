package pl.deniotokiari.capitalgaincalculator.usecase

import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.core.BlockingUseCase
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.feature.profile.ProfileRepository

class GetProfileCurrencyBlockingUseCase(
    private val profileRepository: ProfileRepository
): BlockingUseCase<Unit, Flow<Currency?>> {
    override fun invoke(params: Unit): Flow<Currency?> = profileRepository.getProfileCurrency()
}