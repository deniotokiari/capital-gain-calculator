package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.Relation
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
        @Insert
        suspend fun addPosition(position: Model)

        data class PositionWithCurrency(
            @Embedded val position: Model,
            @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model
        )

        data class PositionWithTickerAndCurrency(
            @Embedded val position: Model,
            @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model,
            @Relation(
                parentColumn = "instrument_id",
                entityColumn = "symbol",
                entity = DbTicker.Model::class
            )
            val ticker: DbTicker.Dao.TickerWithCurrency
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