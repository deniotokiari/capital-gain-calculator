package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import pl.deniotokiari.core.misc.usecase.FlowUseCase

class IsAuthRequiredFlowUseCase(
    private val authDataSource: AuthDataSource,
) : FlowUseCase<Unit, Boolean> {
    override operator fun invoke(input: Unit): Flow<Boolean> =
        authDataSource.authenticationRequired()
}