package pl.deniotokiari.capital.gain.calculator.di

import kotlinx.coroutines.Dispatchers
import org.koin.dsl.module
import pl.deniotokiari.capital.gain.calculator.feature.currency.di.currencyPreviewModule
import pl.deniotokiari.core.misc.AppDispatchers
import kotlin.coroutines.CoroutineContext

val previewModule = module {
    single<AppDispatchers> {
        object : AppDispatchers {
            override val io: CoroutineContext = Dispatchers.Default
            override val default: CoroutineContext = Dispatchers.Default
            override val main: CoroutineContext = Dispatchers.Main
        }
    }
} + listOf(
    currencyPreviewModule,
)
