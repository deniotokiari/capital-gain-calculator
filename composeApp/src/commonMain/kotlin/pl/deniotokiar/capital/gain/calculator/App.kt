package pl.deniotokiar.capital.gain.calculator

import androidx.compose.runtime.Composable
import org.koin.compose.KoinApplication
import pl.deniotokiar.capital.gain.calculator.di.appModule
import pl.deniotokiar.capital.gain.calculator.presentation.AppScreen

@Composable
fun App() {
    KoinApplication(
        application = {
            modules(
                appModule,
            )
        }
    ) {
        AppScreen()
    }
}