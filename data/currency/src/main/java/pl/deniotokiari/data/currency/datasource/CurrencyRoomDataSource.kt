package pl.deniotokiari.data.currency.datasource

import androidx.room.Dao
import androidx.room.Database
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.data.currency.model.DbCurrency

@Dao
interface CurrencyRoomDataSource {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun addCurrencies(items: List<DbCurrency>)

    @Query("SELECT * FROM currency")
    fun getCurrencies(): Flow<List<DbCurrency>>
}

@Database(
    entities = [DbCurrency::class],
    version = 1,
    exportSchema = false
)
@TypeConverters(
    DbCurrency.Converter::class
)
abstract class CurrencyDataBase : RoomDatabase() {
    abstract fun currencyDao(): CurrencyRoomDataSource
}