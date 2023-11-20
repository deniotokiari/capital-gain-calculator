package pl.deniotokiari.capitalgaincalculator.data.db

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Single

@Database(
    entities = [
        DbCurrency.Model::class,
        DbPortfolio.Model::class,
        DbInstrument.Model::class,
        DbTicker.Model::class
    ], version = 1,
    exportSchema = false
)
@TypeConverters(
    DbCurrency.Converter::class,
    DbInstrument.Converter::class,
    DbTicker.Converter::class
)
abstract class AppDataBase : RoomDatabase() {
    abstract fun portfolioDao(): DbPortfolio.Dao

    abstract fun currencyDao(): DbCurrency.Dao

    abstract fun instrumentDao(): DbInstrument.Dao

    abstract fun tickerDao(): DbTicker.Dao
}

@Single
fun create(context: Context): AppDataBase = Room.databaseBuilder(context, AppDataBase::class.java, "app_db").build()

@Factory
fun portfolioDao(db: AppDataBase): DbPortfolio.Dao = db.portfolioDao()

@Factory
fun currencyDao(db: AppDataBase): DbCurrency.Dao = db.currencyDao()

@Factory
fun instrumentDao(db: AppDataBase): DbInstrument.Dao = db.instrumentDao()

@Factory
fun tickerDao(db: AppDataBase): DbTicker.Dao = db.tickerDao()