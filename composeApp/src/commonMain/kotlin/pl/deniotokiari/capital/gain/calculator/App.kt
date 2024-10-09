package pl.deniotokiari.capital.gain.calculator

import androidx.compose.runtime.Composable
import org.koin.compose.KoinApplication
import pl.deniotokiari.capital.gain.calculator.di.appModule
import pl.deniotokiari.capital.gain.calculator.presentation.AppScreen
import pl.deniotokiari.capital.gain.calculator.feature.auth.di.authModule

@Composable
fun App() {
    KoinApplication(
        application = {
            modules(
                appModule,
                authModule,
            )
        }
    ) {
        AppScreen()
    }
}