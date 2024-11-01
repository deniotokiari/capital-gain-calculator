package pl.deniotokiari.capital.gain.calculator

import kotlinx.coroutines.await
import kotlinx.serialization.KSerializer
import kotlinx.serialization.builtins.ListSerializer
import kotlinx.serialization.json.Json
import kotlin.js.Promise

external fun getCollection(path: String): Promise<JsAny?>

external fun putItem(path: String, data: String): Promise<JsAny?>

class WebRemoteStore : RemoteStore {
    override suspend fun <T> getCollection(
        path: String,
        itemSerializer: KSerializer<T>,
    ): List<T> {
        val result = getCollection(path).await<JsAny>().unsafeCast<JsString>()

        return Json.decodeFromString(ListSerializer(itemSerializer), result.toString())
    }

    override suspend fun <T> putCollection(
        path: String,
        data: List<T>,
        itemSerializer: KSerializer<T>,
    ) {
        data.forEach { item ->
            putItem(path, Json.encodeToString(itemSerializer, item)).await<JsAny>()
        }
    }
}