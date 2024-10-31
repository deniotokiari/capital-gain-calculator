package pl.deniotokiari.capital.gain.calculator.platform.androidios.remotestore

import dev.gitlive.firebase.Firebase
import dev.gitlive.firebase.firestore.firestore
import kotlinx.serialization.KSerializer
import pl.deniotokiari.capital.gain.calculator.platform.common.remotestore.RemoteStore

class AndroidIosRemoteStore : RemoteStore {
    private val firebaseStore = Firebase.firestore

    override suspend fun <T> getCollection(path: String, serializer: KSerializer<T>): List<T> {
        val result = firebaseStore.collection(path).get().documents.map { document ->
            document.data(serializer)
        }

        return result
    }

    override suspend fun <T> putCollection(
        path: String,
        data: List<T>,
    ) {
        firebaseStore.collection(path).add(data)
    }
}