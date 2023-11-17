package pl.deniotokiari.capitalgaincalculator.data.db

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import org.koin.core.annotation.Single
import org.koin.dsl.module

@Database(
    entities = [
        DbCurrency.Model::class,
        DbPortfolio.Model::class
    ], version = 1
)
@TypeConverters(DbCurrency.Converter::class)
abstract class AppDataBase : RoomDatabase() {
    abstract fun portfolioDao(): DbPortfolio.Dao

    abstract fun currencyDao(): DbCurrency.Dao
}

@Single
class Db(
    context: Context
) {
    val db = Room.databaseBuilder(context, AppDataBase::class.java, "app_db").build()
}

val dbModule = module {
    factory { get<Db>().db.portfolioDao() }
    factory { get<Db>().db.currencyDao() }
}