package pl.deniotokiari.capital.gain.calculator

import dev.gitlive.firebase.Firebase
import dev.gitlive.firebase.firestore.firestore
import kotlinx.serialization.KSerializer

class AndroidIosRemoteStore : RemoteStore {
    private val firestore = Firebase.firestore

    override suspend fun <T> getCollection(
        path: String,
        itemSerializer: KSerializer<T>,
    ): List<T> {
        return firestore.collection(path).get().documents.map { document ->
            document.data(itemSerializer)
        }
    }

    override suspend fun <T : WithId> putCollection(
        path: String,
        data: List<T>,
        itemSerializer: KSerializer<T>,
    ) {
        val ref = firestore.collection(path)

        data.forEach { item ->
            ref.document(item.id).set(item as Any)
        }
    }

    override suspend fun <T> getItem(path: String, itemSerializer: KSerializer<T>): T = firestore
        .document(path)
        .get()
        .data(itemSerializer)

    override suspend fun <T> putItem(path: String, item: T, itemSerializer: KSerializer<T>) {
        firestore.document(path).set(item as Any)
    }
}
