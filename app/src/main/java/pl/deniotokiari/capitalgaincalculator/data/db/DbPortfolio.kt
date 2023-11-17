package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Dao
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.PrimaryKey
import androidx.room.Query
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.data.model.Id
import pl.deniotokiari.capitalgaincalculator.data.model.Portfolio

class DbPortfolio {
    @Entity(tableName = "portfolio")
    data class DbPortfolio(
        @PrimaryKey val id: Long,
        @ColumnInfo(name = "name") val name: String,
        
    )

    @Dao
    interface PortfolioDao {
        @Query("SELECT * FROM portfolio")
        fun portfolios(): Flow<List<DbPortfolio>>

        @Query("SELECT * FROM portfolio WHERE name = :name")
        fun getPortfolioByName(name: String): DbPortfolio?

        @Insert
        fun addPortfolio(portfolio: DbPortfolio)
    }
}

fun DbPortfolio.DbPortfolio.toDataModel(): Portfolio = Portfolio(
    id = Id(id),
    name = name
)

fun List<DbPortfolio.DbPortfolio>.toDataModelList(): List<Portfolio> = map { it.toDataModel() }

fun Portfolio.toDbModel(): DbPortfolio.DbPortfolio = DbPortfolio.DbPortfolio(
    id = id.value,
    name = name
)