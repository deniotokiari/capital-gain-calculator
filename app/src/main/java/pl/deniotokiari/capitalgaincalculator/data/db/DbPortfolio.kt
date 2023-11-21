package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.PrimaryKey
import androidx.room.Query
import androidx.room.Relation
import androidx.room.Transaction
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.data.model.Portfolio

class DbPortfolio {
    @Entity(tableName = "portfolio")
    data class Model(
        @PrimaryKey val name: String,
        @ColumnInfo("currency_code") val currencyCode: String
    )

    @androidx.room.Dao
    interface Dao {
        @Transaction
        @Query("SELECT * FROM portfolio")
        fun portfolios(): Flow<List<PortfolioWithCurrency>>

        @Transaction
        @Query("SELECT * FROM portfolio WHERE name = :name")
        fun getPortfolioByName(name: String): PortfolioWithCurrency?

        @Insert
        fun addPortfolio(portfolio: Model)

        @Query("SELECT name FROM portfolio WHERE name = :id")
        suspend fun getName(id: String): String
    }

    data class PortfolioWithCurrency(
        @Embedded val portfolio: Model,
        @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model
    )
}

fun DbPortfolio.PortfolioWithCurrency.toDataModel() = Portfolio(
    name = portfolio.name,
    currency = currency.toDataModel()
)

fun Portfolio.toDbPortfolio(): DbPortfolio.Model = DbPortfolio.Model(
    name = name,
    currencyCode = currency.code.value
)