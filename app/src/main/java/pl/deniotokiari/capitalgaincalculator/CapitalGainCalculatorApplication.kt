package pl.deniotokiari.capitalgaincalculator

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.workmanager.koin.workManagerFactory
import org.koin.core.context.startKoin
import org.koin.ksp.generated.module
import pl.deniotokiari.core.network.NetworkModule
import pl.deniotokiari.data.currency.CurrencyDataModule
import pl.deniotokiari.feature.init_profile.InitProfileModule
import pl.deniotokiari.navigation.NavigationModule

class CapitalGainCalculatorApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        startKoin {
            properties(
                mapOf(
                    "alpha_vantage_api_key" to BuildConfig.ALPHA_VANTAGE_API_KEY,
                    "poligon_api_key" to BuildConfig.POLIGON_API_KEY,
                    "y_finance_api_keys" to BuildConfig.YAHOO_FINANCE_API_KEYS
                )
            )

            androidContext(this@CapitalGainCalculatorApplication)
            workManagerFactory()

            modules(
                // general
                NetworkModule().module,
                NavigationModule().module,

                // data
                CurrencyDataModule().module,

                // domain

                // feature
                InitProfileModule().module
            )
        }
    }
}