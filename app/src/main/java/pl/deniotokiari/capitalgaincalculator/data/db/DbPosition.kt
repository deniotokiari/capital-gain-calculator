package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Relation
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.data.model.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.data.model.Position
import java.math.BigDecimal
import java.time.LocalDate

class DbPosition {
    @Entity(tableName = "position", primaryKeys = ["instrument_id", "count", "price", "date"])
    class Model(
        @ColumnInfo("instrument_id") val instrumentId: String,
        val count: BigDecimal,
        val price: BigDecimal,
        @ColumnInfo("currency_code") val currencyCode: String,
        val date: LocalDate
    )

    @androidx.room.Dao
    interface Dao {
        @Insert
        suspend fun addPosition(position: Model)

        @Query("SELECT * FROM position WHERE instrument_id IN (:id)")
        fun positionsByInstrumentsId(id: List<String>): Flow<List<PositionWithCurrency>>

        data class PositionWithCurrency(
            @Embedded val position: Model,
            @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model
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