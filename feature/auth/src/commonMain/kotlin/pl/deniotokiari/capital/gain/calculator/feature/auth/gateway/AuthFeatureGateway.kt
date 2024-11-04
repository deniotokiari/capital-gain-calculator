package pl.deniotokiari.capital.gain.calculator.feature.auth.gateway

import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase.GetUserIdUseCase
import pl.deniotokiari.capital.gain.calculator.gateway.feature.auth.AuthGateway
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.mapError

class AuthFeatureGateway(
    private val getUserIdUseCase: GetUserIdUseCase,
) : AuthGateway {
    override suspend fun getUserId(): Result<String, Exception> = getUserIdUseCase(Unit)
        .mapError { Exception("Something went wrong") }
}