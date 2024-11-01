package pl.deniotokiari.capital.gain.calculator.feature.auth.data

import kotlinx.coroutines.flow.Flow

interface AuthDataSource {
    fun authenticationRequired(): Flow<Boolean>
    suspend fun signup(email: String, password: String): Result<Boolean>
    suspend fun login(email: String, password: String): Result<Boolean>
    suspend fun getUserId(): Result<String>
}