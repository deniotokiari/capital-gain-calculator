package pl.deniotokiari.core.misc

import kotlin.coroutines.CoroutineContext

interface AppDispatchers {
    val io: CoroutineContext
    val default: CoroutineContext
    val main: CoroutineContext
}