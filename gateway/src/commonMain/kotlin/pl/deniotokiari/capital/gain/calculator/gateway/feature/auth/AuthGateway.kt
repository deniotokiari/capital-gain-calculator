package pl.deniotokiari.capital.gain.calculator.gateway.feature.auth

import pl.deniotokiari.core.misc.Result

interface AuthGateway {
    suspend fun getUserId(): Result<String, Exception>
}
