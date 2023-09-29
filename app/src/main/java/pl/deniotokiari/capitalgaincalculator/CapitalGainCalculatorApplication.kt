package pl.deniotokiari.capitalgaincalculator

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.workmanager.koin.workManagerFactory
import org.koin.core.context.startKoin
import pl.deniotokiari.capitalgaincalculator.alphavantage.alphaVantageModule
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyUpdateWorker
import pl.deniotokiari.capitalgaincalculator.currency.currencyModule
import pl.deniotokiari.capitalgaincalculator.db.appDataBaseModule
import pl.deniotokiari.capitalgaincalculator.di.appModule
import pl.deniotokiari.capitalgaincalculator.feature.home.homeModule
import pl.deniotokiari.capitalgaincalculator.feature.initialization.initializeModule
import pl.deniotokiari.capitalgaincalculator.feature.instrument.instrumentModule
import pl.deniotokiari.capitalgaincalculator.feature.main.mainModule
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.portfolioModule
import pl.deniotokiari.capitalgaincalculator.feature.position.positionModule
import pl.deniotokiari.capitalgaincalculator.feature.profile.profileModule
import pl.deniotokiari.capitalgaincalculator.feature.symbol.symbolModule
import pl.deniotokiari.capitalgaincalculator.network.networkModule
import pl.deniotokiari.capitalgaincalculator.usecase.useCaseModule

class CapitalGainCalculatorApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@CapitalGainCalculatorApplication)
            workManagerFactory()

            modules(
                appModule,
                appDataBaseModule,
                networkModule,
                currencyModule,
                alphaVantageModule,
                useCaseModule,
                mainModule,
                initializeModule,
                profileModule,
                homeModule,
                portfolioModule,
                symbolModule,
                instrumentModule,
                positionModule
            )
        }

        CurrencyUpdateWorker.start(this)
    }
}