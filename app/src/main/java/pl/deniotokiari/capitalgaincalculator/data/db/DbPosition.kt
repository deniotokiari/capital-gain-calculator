package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Transaction
import kotlinx.coroutines.flow.Flow
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

        @Transaction
        @Query("SELECT * FROM position WHERE instrument_id = :id")
        fun positionsByInstrumentId(id: String): Flow<List<Model>>
    }
}