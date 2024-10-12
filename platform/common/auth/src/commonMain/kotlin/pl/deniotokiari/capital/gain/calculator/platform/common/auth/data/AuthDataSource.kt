package pl.deniotokiari.capital.gain.calculator.platform.common.auth.data

import kotlinx.coroutines.flow.Flow

interface AuthDataSource {
    fun authenticationRequired(): Flow<Boolean>
}