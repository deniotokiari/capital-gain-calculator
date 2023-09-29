package pl.deniotokiari.capitalgaincalculator.feature.portfolio

import android.os.Parcelable
import androidx.room.Dao
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.PrimaryKey
import androidx.room.Query
import androidx.room.Relation
import kotlinx.coroutines.flow.Flow
import kotlinx.parcelize.Parcelize
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.currency.DbCurrency
import pl.deniotokiari.capitalgaincalculator.currency.toCurrency
import pl.deniotokiari.capitalgaincalculator.currency.toDbCurrency
import pl.deniotokiari.capitalgaincalculator.feature.symbol.SymbolDao

@Parcelize
data class Portfolio(
    val name: String,
    val currency: Currency
) : Parcelable

@Entity(tableName = "portfolio")
data class DbPortfolio(
    val name: String,
    val currencyId: String,
    @PrimaryKey
    val id: String = name,
)

@Dao
interface PortfolioDao {
    @Query("SELECT * FROM portfolio")
    fun getAll(): Flow<List<PortfolioAndCurrency>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(portfolio: DbPortfolio)

    @Query("DELETE FROM portfolio WHERE id = :id")
    suspend fun delete(id: String)

    @Query("SELECT symbol.* FROM instrument JOIN symbol ON instrument.symbolId = symbol.id WHERE instrument.portfolioId = :portfolioId")
    fun getPortfolioSymbols(portfolioId: String): Flow<List<SymbolDao.SymbolAndCurrency>>

    @Query("SELECT * FROM portfolio WHERE id = :id")
    suspend fun getPortfolioById(id: String): PortfolioAndCurrency

    data class PortfolioAndCurrency(
        @Embedded
        val portfolio: DbPortfolio,
        @Relation(
            parentColumn = "currencyId",
            entityColumn = "id"
        )
        val currency: DbCurrency
    )
}

fun PortfolioDao.PortfolioAndCurrency.toPortfolio(): Portfolio = Portfolio(
    name = portfolio.name,
    currency = currency.toCurrency()
)

fun Portfolio.toDbPortfolio(): DbPortfolio = DbPortfolio(
    name = name,
    currencyId = currency.toDbCurrency().id
)
