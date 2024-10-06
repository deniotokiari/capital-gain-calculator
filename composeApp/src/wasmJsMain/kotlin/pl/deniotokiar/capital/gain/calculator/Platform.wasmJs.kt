package pl.deniotokiar.capital.gain.calculator

import kotlinx.coroutines.await
import kotlinx.serialization.json.Json
import pl.deniotokiar.capital.gain.calculator.presentation.User
import kotlin.js.Promise

external fun collection(path: String): Promise<JsAny?>

class WasmPlatform : Platform {
    override suspend fun getUsers(): List<User> {
        val result = collection("USERS").await<JsAny>().unsafeCast<JsString>()

        return Json.decodeFromString<List<User>>(result.toString()) + User("Web", 12)
    }
}

actual fun getPlatform(): Platform = WasmPlatform()