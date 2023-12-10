package pl.deniotokiari.capitalgaincalculator

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.workmanager.koin.workManagerFactory
import org.koin.core.context.startKoin
import org.koin.ksp.generated.module
import pl.deniotokiari.navigation.NavigationModule

class CapitalGainCalculatorApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@CapitalGainCalculatorApplication)
            workManagerFactory()

            modules(
                NavigationModule().module
            )
        }
    }
}