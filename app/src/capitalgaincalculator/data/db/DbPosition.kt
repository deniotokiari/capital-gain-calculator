package legacy.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Relation
import androidx.room.Transaction
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.model.Position
import java.math.BigDecimal
import java.time.LocalDate

class DbPosition {
    @Entity(tableName = "position", primaryKeys = ["instrument_id", "count", "price", "date", "portfolio_id"])
    class Model(
        @ColumnInfo("instrument_id") val instrumentId: String,
        @ColumnInfo("portfolio_id") val portfolioId: String,
        val count: BigDecimal,
        val price: BigDecimal,
        @ColumnInfo("currency_code") val currencyCode: String,
        val date: LocalDate
    )

    @androidx.room.Dao
    interface Dao {
        @Query("DELETE FROM position WHERE portfolio_id = :id")
        suspend fun deleteByPortfolio(id: String)

        @Insert(onConflict = OnConflictStrategy.IGNORE)
        suspend fun addPosition(position: Model)

        @Query("SELECT * FROM position")
        fun positions(): Flow<Model>

        @Transaction
        @Query("SELECT * FROM position WHERE portfolio_id = :portfolio")
        suspend fun positionsByPortfolio(portfolio: String): List<PositionWithTickerOrCurrency>

        data class PositionWithCurrency(
            @Embedded val position: Model,
            @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model
        )

        data class PositionWithTickerOrCurrency(
            @Embedded val position: Model,
            @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model,
            @Relation(
                parentColumn = "instrument_id",
                entityColumn = "symbol",
                entity = DbTicker.Model::class
            )
            val tickerPosition: DbTicker.Dao.TickerWithCurrency?,
            @Relation(
                parentColumn = "instrument_id",
                entityColumn = "code"
            )
            val currencyPosition: DbCurrency.Model?
        )
    }
}

fun DbPosition.Dao.PositionWithCurrency.toDataModel(): Position = Position(
    count = position.count,
    price = CurrencyValue(
        value = position.price,
        currency = currency.toDataModel()
    ),
    date = position.date
)