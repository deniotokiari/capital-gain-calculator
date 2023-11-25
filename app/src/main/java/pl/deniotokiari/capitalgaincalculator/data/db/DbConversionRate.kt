package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import java.math.BigDecimal

class DbConversionRate {
    @Entity("conversion_rate", primaryKeys = ["from_code", "to_code"])
    data class Model(
        @ColumnInfo("from_code") val fromCode: String,
        @ColumnInfo("to_code") val toCode: String,
        val rate: BigDecimal
    )

    @androidx.room.Dao
    interface Dao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        suspend fun addRate(item: Model)

        @Query("SELECT rate FROM conversion_rate WHERE from_code = :from AND to_code = :to")
        suspend fun rate(from: String, to: String): BigDecimal?
    }
}