package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.usecase

import pl.deniotokiari.capital.gain.calculator.feature.auth.data.AuthDataSource
import pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model.AuthError
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok
import pl.deniotokiari.core.misc.usecase.UseCase

class LoginUserWithEmailAndPasswordUseCase(
    private val authRepository: AuthDataSource,
) : UseCase<LoginUserWithEmailAndPasswordUseCase.Params, Result<Unit, AuthError>> {
    override suspend fun invoke(input: Params): Result<Unit, AuthError> = authRepository
        .login(
            email = input.email,
            password = input.password,
        )
        .fold(
            onSuccess = { Unit.ok() },
            onError = { AuthError.GenericError.error() },
        )

    data class Params(
        val email: String,
        val password: String,
    )
}