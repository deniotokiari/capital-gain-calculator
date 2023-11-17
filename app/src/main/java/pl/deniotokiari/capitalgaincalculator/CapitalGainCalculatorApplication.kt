package pl.deniotokiari.capitalgaincalculator

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.workmanager.koin.workManagerFactory
import org.koin.core.context.startKoin
import org.koin.ksp.generated.defaultModule
import pl.deniotokiari.capitalgaincalculator.data.db.dbModule

class CapitalGainCalculatorApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@CapitalGainCalculatorApplication)
            workManagerFactory()

            modules(
                appModule,
                defaultModule,
                dbModule
            )
        }
    }
}