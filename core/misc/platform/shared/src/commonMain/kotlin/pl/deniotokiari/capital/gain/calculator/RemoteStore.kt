package pl.deniotokiari.capital.gain.calculator

import kotlinx.serialization.KSerializer

interface RemoteStore {
    suspend fun <T : EntityWithId> getCollection(
        path: String,
        itemSerializer: KSerializer<T>,
    ): List<T>

    suspend fun <T : EntityWithId> putCollection(
        path: String,
        data: List<T>,
        itemSerializer: KSerializer<T>,
    )
}

interface EntityWithId {
    val id: String
}
