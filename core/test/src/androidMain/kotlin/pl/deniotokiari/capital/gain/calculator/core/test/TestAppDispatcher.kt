package pl.deniotokiari.capital.gain.calculator.core.test

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.setMain
import pl.deniotokiari.core.misc.AppDispatchers
import kotlin.coroutines.CoroutineContext

@OptIn(ExperimentalCoroutinesApi::class)
fun TestScope.getAppDispatcher(): AppDispatchers {
    Dispatchers.setMain(dispatcher = UnconfinedTestDispatcher(testScheduler))

    return object : AppDispatchers {
        override val io: CoroutineContext = UnconfinedTestDispatcher(testScheduler)
        override val main: CoroutineContext = UnconfinedTestDispatcher(testScheduler)
        override val default: CoroutineContext = UnconfinedTestDispatcher(testScheduler)
    }
}