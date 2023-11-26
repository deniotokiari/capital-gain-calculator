package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
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
        @Query("DELETE FROM instrument WHERE portfolio_id = :id")
        suspend fun deleteByPortfolio(id: String)

        @Insert(onConflict = OnConflictStrategy.IGNORE)
        suspend fun addInstrument(instrument: Model)

        @Transaction
        @Query("SELECT ticker.*, position.* " +
                "FROM instrument JOIN ticker ON instrument.id = ticker.symbol " +
                "LEFT JOIN position ON position.instrument_id = instrument.id AND position.portfolio_id = instrument.portfolio_id " +
                "WHERE instrument.portfolio_id = :portfolioId " +
                "ORDER BY position.date DESC")
        fun positionsByPortfolioId(portfolioId: String): Flow<Map<DbTicker.Dao.TickerWithCurrency, List<DbPosition.Dao.PositionWithCurrency>>>
    }

    class Converter {
        @TypeConverter
        fun fromType(value: Type): Int = value.ordinal

        @TypeConverter
        fun toType(value: Int): Type = enumValues<Type>()[value]
    }
}