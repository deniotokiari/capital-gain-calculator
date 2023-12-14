package pl.deniotokiari.data.portfolio.datasource

import androidx.room.Dao
import androidx.room.Database
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.RoomDatabase
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.data.portfolio.model.DbPortfolio

@Dao
interface PortfolioRoomDataSource {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun addPortfolio(portfolio: DbPortfolio)

    @Query("DELETE FROM portfolio WHERE name = :name")
    suspend fun deletePortfolio(name: String)

    @Query("SELECT * FROM portfolio")
    fun getPortfolios(): Flow<List<DbPortfolio>>
}

@Database(
    entities = [DbPortfolio::class],
    version = 1,
    exportSchema = false
)
abstract class PortfolioDataBase : RoomDatabase() {
    abstract fun portfolioDao(): PortfolioRoomDataSource
}