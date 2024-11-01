package pl.deniotokiari.capital.gain.calculator.feature.auth.data

import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.await
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.launch
import kotlin.js.Promise

private val state = MutableSharedFlow<Boolean>(replay = 1)

@OptIn(ExperimentalJsExport::class, DelicateCoroutinesApi::class)
@JsExport
fun updateAuthState(isAuthenticated: Boolean) {
    GlobalScope.launch {
        state.emit(!isAuthenticated)
    }
}

external fun getUserUid(): String?

external fun createUserWithEmailAndPassword(email: String, password: String): Promise<JsAny>

external fun signInWithEmailAndPassword(email: String, password: String): Promise<JsAny>

class WebAuthDataSource : AuthDataSource {
    override fun authenticationRequired(): Flow<Boolean> = state

    override suspend fun signup(email: String, password: String): Result<Boolean> = runCatching {
        createUserWithEmailAndPassword(
            email = email,
            password = password,
        ).await<JsAny>().unsafeCast<JsBoolean>().toBoolean()
    }

    override suspend fun login(email: String, password: String): Result<Boolean> = runCatching {
        signInWithEmailAndPassword(
            email = email,
            password = password,
        ).await<JsAny>().unsafeCast<JsBoolean>().toBoolean()
    }

    override suspend fun getUserId(): Result<String> = runCatching {
        getUserUid() ?: error("User is not authenticated")
    }
}
