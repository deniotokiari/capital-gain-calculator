package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import pl.deniotokiari.capital.gain.calculator.feature.auth.data.AuthDataSource
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import pl.deniotokiari.core.misc.usecase.UseCase

class SignupUserWithEmailAndPasswordUseCase(
    private val authDataSource: AuthDataSource,
) : UseCase<SignupUserWithEmailAndPasswordUseCase.Params, Result<Unit, AuthError>> {
    override suspend fun invoke(input: Params): Result<Unit, AuthError> = authDataSource.signup(
        email = input.email,
        password = input.password,
    ).fold(
        onSuccess = { result ->
            if (result) {
                Unit.ok()
            } else {
                AuthError.InvalidCredentials.error()
            }
        },
        onError = { AuthError.GenericError.error() },
    )

    data class Params(
        val email: String,
        val password: String,
    )
}