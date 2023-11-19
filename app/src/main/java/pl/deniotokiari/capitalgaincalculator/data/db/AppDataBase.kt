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
        DbPortfolio.Model::class
    ], version = 1,
    exportSchema = false
)
@TypeConverters(DbCurrency.Converter::class)
abstract class AppDataBase : RoomDatabase() {
    abstract fun portfolioDao(): DbPortfolio.Dao

    abstract fun currencyDao(): DbCurrency.Dao
}

@Single
fun create(context: Context): AppDataBase = Room.databaseBuilder(context, AppDataBase::class.java, "app_db").build()

@Factory
fun portfolioDao(db: AppDataBase): DbPortfolio.Dao = db.portfolioDao()

@Factory
fun currencyDao(db: AppDataBase): DbCurrency.Dao = db.currencyDao()