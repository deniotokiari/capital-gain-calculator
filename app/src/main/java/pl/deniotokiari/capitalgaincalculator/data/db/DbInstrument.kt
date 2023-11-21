package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Relation
import androidx.room.Transaction
import androidx.room.TypeConverter
import kotlinx.coroutines.flow.Flow

class DbInstrument {
    @Entity(tableName = "instrument", primaryKeys = ["portfolio_id", "id"])
    data class Model(
        @ColumnInfo("portfolio_id") val portfolioId: String,
        val id: String,
        val type: Type
    )

    enum class Type {
        Ticker
    }

    @androidx.room.Dao
    interface Dao {
        @Insert
        suspend fun addInstrument(instrument: Model)

        @Transaction
        @Query("SELECT * FROM instrument WHERE portfolio_id = :id AND type = :type")
        fun instrumentsByPortfolioId(id: String, type: Type): Flow<List<InstrumentWithTicker>>

        data class InstrumentWithTicker(
            @Embedded val instrument: Model,
            @Relation(
                parentColumn = "id",
                entityColumn = "symbol",
                entity = DbTicker.Model::class
            )
            val ticker: DbTicker.Dao.TickerWithCurrency
        )
    }

    class Converter {
        @TypeConverter
        fun fromType(value: Type): Int = value.ordinal

        @TypeConverter
        fun toType(value: Int): Type = enumValues<Type>()[value]
    }
}