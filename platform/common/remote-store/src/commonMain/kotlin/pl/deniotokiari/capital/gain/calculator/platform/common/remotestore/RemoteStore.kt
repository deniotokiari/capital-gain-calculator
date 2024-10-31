package pl.deniotokiari.capital.gain.calculator.platform.common.remotestore

import kotlinx.serialization.KSerializer

interface RemoteStore {
    suspend fun <T> getCollection(path: String, serializer: KSerializer<T>): List<T>

    suspend fun <T> putCollection(path: String, data: List<T>)
}