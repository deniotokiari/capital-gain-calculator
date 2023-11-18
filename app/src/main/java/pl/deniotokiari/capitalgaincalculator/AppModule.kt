package pl.deniotokiari.capitalgaincalculator

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.preferencesDataStore
import androidx.work.WorkManager
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Dispatchers
import org.koin.core.qualifier.named
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.core.network.ANONYMOUS
import pl.deniotokiari.capitalgaincalculator.core.network.anonymous
import pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.AlphaVantageService
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppNavigation

val appModule = module {
    single { get<Context>().dataStore }
    single { AppDispatchers() }
    single { WorkManager.getInstance(get()) }
    single(named(ANONYMOUS)) { anonymous }
    single { AppNavigation() }
    single { AlphaVantageService.create(get(named(ANONYMOUS)), get()) }
}

private val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "settings")

data class AppDispatchers(
    val io: CoroutineDispatcher = Dispatchers.IO
)