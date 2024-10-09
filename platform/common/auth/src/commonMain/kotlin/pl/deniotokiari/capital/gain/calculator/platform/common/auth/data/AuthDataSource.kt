package pl.deniotokiari.capital.gain.calculator.platform.common.auth.data

interface AuthDataSource {
    suspend fun test(): String
}