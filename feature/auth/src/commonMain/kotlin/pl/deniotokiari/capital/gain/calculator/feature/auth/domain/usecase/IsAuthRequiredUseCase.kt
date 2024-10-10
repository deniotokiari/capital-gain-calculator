package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.delay
import pl.deniotokiari.core.misc.usecase.UseCase

class IsAuthRequiredUseCase : UseCase<Unit, Boolean> {
    override suspend fun invoke(input: Unit): Boolean {
        delay(5 * 1000L)

        return true
    }
}