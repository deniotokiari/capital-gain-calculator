package pl.deniotokiari.capital.gain.calculator

import kotlinx.coroutines.await
import kotlinx.serialization.KSerializer
import kotlinx.serialization.builtins.ListSerializer
import kotlinx.serialization.json.Json
import kotlin.js.Promise

external fun externalGetCollection(path: String): Promise<JsAny?>

external fun externalPutItem(path: String, data: String): Promise<JsAny?>

external fun externalGetItem(path: String): Promise<JsAny?>

class WebRemoteStore : RemoteStore {
    override suspend fun <T> getCollection(
        path: String,
        itemSerializer: KSerializer<T>,
    ): List<T> {
        val result = externalGetCollection(path).await<JsAny>().unsafeCast<JsString>()

        return Json.decodeFromString(ListSerializer(itemSerializer), result.toString())
    }

    override suspend fun <T : WithId> putCollection(
        path: String,
        data: List<T>,
        itemSerializer: KSerializer<T>,
    ) {
        data.forEach { item ->
            externalPutItem(
                path = "$path/${item.id}",
                data = Json.encodeToString(itemSerializer, item),
            ).await<JsAny>()
        }
    }

    override suspend fun <T> getItem(path: String, itemSerializer: KSerializer<T>): T {
        val result = externalGetItem(path).await<JsAny>().unsafeCast<JsString>()

        return Json.decodeFromString(itemSerializer, result.toString())
    }

    override suspend fun <T> putItem(path: String, item: T, itemSerializer: KSerializer<T>) {
        externalPutItem(
            path = path,
            data = Json.encodeToString(itemSerializer, item),
        ).await<JsAny>()
    }
}
