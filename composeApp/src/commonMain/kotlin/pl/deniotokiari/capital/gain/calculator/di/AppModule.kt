package pl.deniotokiari.capital.gain.calculator.di

import kotlinx.coroutines.Dispatchers
import org.koin.core.module.dsl.singleOf
import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.RemoteStore
import pl.deniotokiari.capital.gain.calculator.presentation.AppViewModel
import pl.deniotokiari.core.misc.AppDispatchers
import pl.deniotokiari.core.misc.LocalStore
import pl.deniotokiari.core.misc.RemoteStore
import kotlin.coroutines.CoroutineContext

val appModule = module {
    single<AppDispatchers> {
        object : AppDispatchers {
            override val io: CoroutineContext = Dispatchers.Default
            override val default: CoroutineContext = Dispatchers.Default
            override val main: CoroutineContext = Dispatchers.Main
        }
    }
    single<RemoteStore> { RemoteStore() }

    singleOf(::LocalStore)

    viewModelOf(::AppViewModel)
}
