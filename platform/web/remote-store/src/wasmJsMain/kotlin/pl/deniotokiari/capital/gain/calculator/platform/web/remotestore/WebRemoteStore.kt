package pl.deniotokiari.capital.gain.calculator.platform.web.remotestore

import kotlinx.coroutines.await
import kotlinx.serialization.KSerializer
import kotlinx.serialization.json.Json
import pl.deniotokiari.capital.gain.calculator.platform.common.remotestore.RemoteStore
import kotlin.js.Promise

external fun collection(path: String): Promise<JsAny?>

class WebRemoteStore : RemoteStore {
    override suspend fun <T> getCollection(path: String, serializer: KSerializer<T>): List<T> {
        val result = collection(path).await<JsAny>().unsafeCast<JsString>()

        return Json.decodeFromString<List<T>>(result.toString())
    }

    override suspend fun <T> putCollection(path: String, data: List<T>) {

    }
}