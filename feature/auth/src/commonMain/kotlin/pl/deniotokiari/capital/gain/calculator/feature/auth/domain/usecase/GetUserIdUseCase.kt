package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import pl.deniotokiari.capital.gain.calculator.feature.auth.data.AuthDataSource
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.mapError
import pl.deniotokiari.core.misc.usecase.UseCase

class GetUserIdUseCase(
    private val authDataSource: AuthDataSource,
) : UseCase<Unit, Result<String, AuthError>> {
    override suspend fun invoke(input: Unit): Result<String, AuthError> = authDataSource
        .getUserId()
        .mapError { AuthError.GenericError }

}