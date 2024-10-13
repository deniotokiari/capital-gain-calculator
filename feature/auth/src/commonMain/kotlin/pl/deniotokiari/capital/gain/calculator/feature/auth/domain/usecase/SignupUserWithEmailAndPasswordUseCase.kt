package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.usecase.UseCase

class SignupUserWithEmailAndPasswordUseCase(
    private val authDataSource: AuthDataSource,
) : UseCase<SignupUserWithEmailAndPasswordUseCase.Params, Result<Boolean, AuthError>> {
    override suspend fun invoke(input: Params): Result<Boolean, AuthError> = authDataSource.signup(
        email = input.email,
        password = input.password,
    ).fold(
        onSuccess = { result ->
            if (result) {
                Result.Success(result)
            } else {
                Result.Error(AuthError.InvalidCredentials)
            }
        },
        onFailure = { Result.Error(AuthError.GenericError) },
    )

    data class Params(
        val email: String,
        val password: String,
    )
}