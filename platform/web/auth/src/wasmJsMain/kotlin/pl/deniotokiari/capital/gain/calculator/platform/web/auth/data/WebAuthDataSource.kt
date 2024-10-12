package pl.deniotokiari.capital.gain.calculator.platform.web.auth.data

import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.await
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.launch
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import kotlin.js.Promise

private val state = MutableSharedFlow<Boolean>()

@OptIn(ExperimentalJsExport::class, DelicateCoroutinesApi::class)
@JsExport
fun updateAuthState(isAuthenticated: Boolean) {
    GlobalScope.launch {
        state.emit(!isAuthenticated)
    }
}

external fun createUserWithEmailAndPassword(email: String, password: String): Promise<JsAny>

class WebAuthDataSource : AuthDataSource {
    override fun authenticationRequired(): Flow<Boolean> = state

    override suspend fun signup(email: String, password: String): Result<Boolean> = runCatching {
        createUserWithEmailAndPassword(
            email = email,
            password = password,
        ).await<JsAny>().unsafeCast<JsBoolean>().toBoolean()
    }

    override suspend fun login(email: String, password: String): Result<Boolean> {
        TODO("Not yet implemented")
    }
}