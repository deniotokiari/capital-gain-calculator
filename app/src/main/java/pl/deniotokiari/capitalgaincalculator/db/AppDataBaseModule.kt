package pl.deniotokiari.capitalgaincalculator.db

import androidx.room.Room
import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module

val appDataBaseModule = module {
    single { Room.databaseBuilder(androidContext(), AppDatabase::class.java, "app_db").build() }
}