package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.PrimaryKey
import androidx.room.Query
import androidx.room.Relation
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import java.math.BigDecimal

class DbTicker {
    @Entity(tableName = "ticker")
    data class Model(
        @PrimaryKey val symbol: String,
        @ColumnInfo("currency_code") val currencyCode: String,
        val price: BigDecimal
    )

    @androidx.room.Dao
    interface Dao {
        @Query("SELECT symbol FROM ticker")
        suspend fun tickers(): List<String>

        @Query("DELETE FROM ticker WHERE symbol IN (:items)")
        suspend fun delete(items: List<String>)

        @Query("SELECT symbol FROM ticker LEFT JOIN instrument ON ticker.symbol = instrument.id WHERE instrument.id IS NULL")
        suspend fun tickersWithoutInstrument(): List<String>

        @Insert(onConflict = OnConflictStrategy.IGNORE)
        suspend fun addTicker(ticker: Model)

        @Query("SELECT * FROM ticker WHERE symbol = :ticker")
        suspend fun ticker(ticker: String): Model?

        @Query("UPDATE ticker SET price = :price WHERE symbol = :ticker")
        suspend fun updatePrice(ticker: String, price: BigDecimal)

        data class TickerWithCurrency(
            @Embedded val ticker: Model,
            @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model
        )
    }
}

fun Ticker.Search.toDbModel(currency: Currency, price: BigDecimal): DbTicker.Model = DbTicker.Model(
    symbol = symbol,
    currencyCode = currency.code.value,
    price = price
)

fun DbTicker.Dao.TickerWithCurrency.toDataModel(): Ticker = Ticker(
    symbol = ticker.symbol,
    currency = currency.toDataModel()
)