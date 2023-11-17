package pl.deniotokiari.capitalgaincalculator.data.db

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import org.koin.core.annotation.Single
import org.koin.dsl.module

@Database(entities = [DbPortfolio.DbPortfolio::class], version = 1)
abstract class AppDataBase : RoomDatabase() {
    abstract fun portfolioDao(): DbPortfolio.PortfolioDao
}

@Single
class Db(
    private val context: Context
) {
    val db = Room.databaseBuilder(context, AppDataBase::class.java, "app_db").build()
}

val dbModule = module {
    factory { get<Db>().db.portfolioDao() }
}