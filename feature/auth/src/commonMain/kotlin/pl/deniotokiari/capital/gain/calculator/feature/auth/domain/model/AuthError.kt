package pl.deniotokiari.capital.gain.calculator.feature.auth.domain.model

sealed interface AuthError {
    data object GenericError : AuthError
    data object InvalidCredentials : AuthError
}