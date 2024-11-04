package pl.deniotokiari.capital.gain.calculator

import kotlinx.serialization.KSerializer

interface RemoteStore {
    suspend fun <T> getCollection(
        path: String,
        itemSerializer: KSerializer<T>,
    ): List<T>

    suspend fun <T : WithId> putCollection(
        path: String,
        data: List<T>,
        itemSerializer: KSerializer<T>,
    )

    suspend fun <T> putItem(path: String, item: T, itemSerializer: KSerializer<T>)

    suspend fun <T> getItem(path: String, itemSerializer: KSerializer<T>): T
}

interface WithId {
    val id: String
}
