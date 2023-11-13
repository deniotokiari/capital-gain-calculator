package pl.deniotokiari.capitalgaincalculator

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.workmanager.koin.workManagerFactory
import org.koin.core.context.startKoin
import pl.deniotokiari.capitalgaincalculator.data.dataModule
import pl.deniotokiari.capitalgaincalculator.domain.domainModule
import pl.deniotokiari.capitalgaincalculator.ui.uiModule

class CapitalGainCalculatorApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@CapitalGainCalculatorApplication)
            workManagerFactory()

            modules(
                appModule,
                dataModule,
                domainModule,
                uiModule
            )
        }
    }
}