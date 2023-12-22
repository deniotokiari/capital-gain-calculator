package pl.deniotokiari.capitalgaincalculator

import android.app.Application
import android.content.Context
import androidx.datastore.preferences.preferencesDataStore
import androidx.work.WorkManager
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.workmanager.koin.workManagerFactory
import org.koin.core.context.startKoin
import org.koin.dsl.module
import org.koin.ksp.generated.module
import pl.deniotokiari.core.network.NetworkModule
import pl.deniotokiari.data.currency.di.CurrencyDataModule
import pl.deniotokiari.data.portfolio.di.PortfolioModule
import pl.deniotokiari.data.profile.di.ProfileModule
import pl.deniotokiari.domain.di.DomainModule
import pl.deniotokiari.feature.add_portfolio.di.AddPortfolioModule
import pl.deniotokiari.feature.home.di.HomeModule
import pl.deniotokiari.feature.init_profile.di.InitProfileModule
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
                module {
                    factory { WorkManager.getInstance(get()) }
                    factory { get<Context>().dataStore }
                },

                // general
                NetworkModule().module,
                NavigationModule().module,

                // data
                CurrencyDataModule().module,
                ProfileModule().module,
                PortfolioModule().module,

                // domain
                DomainModule().module,

                // feature
                InitProfileModule().module,
                HomeModule().module,
                AddPortfolioModule().module,
                pl.deniotokiari.feature.portfolio.di.PortfolioModule().module
            )
        }
    }
}

private val Context.dataStore by preferencesDataStore(name = "app_settings")