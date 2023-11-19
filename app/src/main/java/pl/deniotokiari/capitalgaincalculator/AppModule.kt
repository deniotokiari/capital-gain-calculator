package pl.deniotokiari.capitalgaincalculator

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.preferencesDataStore
import androidx.work.WorkManager
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Dispatchers
import org.koin.core.annotation.Factory
import org.koin.dsl.module

val appModule = module {
    single { get<Context>().dataStore }
    single { WorkManager.getInstance(get()) }
}

private val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "settings")

@Factory
data class AppDispatchers(
    val io: CoroutineDispatcher = Dispatchers.IO
)