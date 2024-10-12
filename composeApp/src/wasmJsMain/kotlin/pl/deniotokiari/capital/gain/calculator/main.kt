package pl.deniotokiari.capital.gain.calculator

import androidx.compose.ui.ExperimentalComposeUiApi
import androidx.compose.ui.window.ComposeViewport
import kotlinx.browser.document

@OptIn(ExperimentalComposeUiApi::class)
fun main() {
    ComposeViewport(document.body!!) {
        App()
    }
}

/*
external fun collection(path: String): Promise<JsAny?>

override suspend fun getUsers(): List<User> {
        val result = collection("USERS").await<JsAny>().unsafeCast<JsString>()

        return Json.decodeFromString<List<User>>(result.toString()) + User("Web", 12)
}
 */