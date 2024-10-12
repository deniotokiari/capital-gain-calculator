package pl.deniotokiari.capital.gain.calculator.platform.web.auth.data

import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.launch
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource

private val state = MutableSharedFlow<Boolean>()

@OptIn(ExperimentalJsExport::class, DelicateCoroutinesApi::class)
@JsExport
fun updateAuthState(isAuthenticated: Boolean) {
    GlobalScope.launch {
        state.emit(!isAuthenticated)
    }
}

class WebAuthDataSource : AuthDataSource {
    override fun authenticationRequired(): Flow<Boolean> = state
}