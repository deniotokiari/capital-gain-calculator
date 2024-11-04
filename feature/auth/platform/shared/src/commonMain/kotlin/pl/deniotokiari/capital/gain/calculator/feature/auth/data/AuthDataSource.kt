package pl.deniotokiari.capital.gain.calculator.feature.auth.data

import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.core.misc.Result

interface AuthDataSource {
    fun authenticationRequired(): Flow<Boolean>
    suspend fun signup(email: String, password: String): Result<Boolean, Exception>
    suspend fun login(email: String, password: String): Result<Boolean, Exception>
    suspend fun getUserId(): Result<String, Exception>
}
