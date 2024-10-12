package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.flow.first
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import pl.deniotokiari.core.misc.usecase.UseCase

class IsAuthRequiredUseCase(
    private val authDataSource: AuthDataSource
) : UseCase<Unit, Boolean> {
    override suspend fun invoke(input: Unit): Boolean =
        authDataSource.authenticationRequired().first()
}