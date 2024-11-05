package pl.deniotokiari.capital.gain.calculator

import androidx.compose.runtime.Composable
import org.koin.compose.KoinApplication
import pl.deniotokiari.capital.gain.calculator.di.appModule
import pl.deniotokiari.capital.gain.calculator.feature.auth.di.authModule
import pl.deniotokiari.capital.gain.calculator.feature.currency.di.currencyModule
import pl.deniotokiari.capital.gain.calculator.feature.home.di.homeModule
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.di.portfolioModule
import pl.deniotokiari.capital.gain.calculator.feature.settings.di.settingsModule
import pl.deniotokiari.capital.gain.calculator.gateway.di.gateWayModule
import pl.deniotokiari.capital.gain.calculator.presentation.AppScreen

@Composable
fun App() {
    KoinApplication(
        application = {
            modules(
                appModule,
                authModule,
                currencyModule,
                gateWayModule,
                homeModule,
                portfolioModule,
                settingsModule,
            )
        },
    ) {
        AppScreen()
    }
}
