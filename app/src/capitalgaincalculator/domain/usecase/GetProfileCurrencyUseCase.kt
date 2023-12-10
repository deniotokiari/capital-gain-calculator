package legacy.capitalgaincalculator.domain.usecase

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.FlowUseCase
import pl.deniotokiari.capitalgaincalculator.core.successOrNull
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.repository.ProfileRepository

@Factory(binds = [GetProfileCurrencyUseCase::class])
class GetProfileCurrencyUseCase(
    private val profileRepository: ProfileRepository
) : FlowUseCase<Unit, Currency?> {
    override fun invoke(params: Unit): Flow<Currency?> = profileRepository.profileCurrency().map {
        it.successOrNull()
    }
}