package pl.deniotokiari.capital.gain.calculator

import kotlinx.serialization.KSerializer

interface RemoteStore {
    suspend fun <T> getCollection(
        path: String,
        itemSerializer: KSerializer<T>,
    ): List<T>

    suspend fun <T> putCollection(
        path: String,
        data: List<T>,
        itemSerializer: KSerializer<T>,
    )
}