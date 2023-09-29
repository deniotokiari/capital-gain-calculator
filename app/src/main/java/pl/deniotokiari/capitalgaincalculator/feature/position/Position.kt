package pl.deniotokiari.capitalgaincalculator.feature.position

import androidx.room.Dao
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.PrimaryKey
import androidx.room.Query
import androidx.room.Relation
import androidx.room.TypeConverter
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyValue
import pl.deniotokiari.capitalgaincalculator.currency.DbCurrency
import pl.deniotokiari.capitalgaincalculator.currency.toCurrency
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId

data class Position(
    val date: LocalDateTime,
    val count: Double,
    val price: CurrencyValue
)

@Entity(tableName = "position")
data class DbPosition(
    val instrumentId: String,
    val count: Double,
    val price: Double,
    val currencyId: String,
    val date: LocalDateTime,
    @PrimaryKey
    val id: String = instrumentId + count + price + currencyId + date.atZone(ZoneId.systemDefault()).toEpochSecond()
) {
    class Converters {
        @TypeConverter
        fun fromLocalDateTime(date: LocalDateTime): Long = date.atZone(ZoneId.systemDefault()).toEpochSecond()

        @TypeConverter
        fun toLocalDateTime(time: Long): LocalDateTime =
            Instant.ofEpochSecond(time).atZone(ZoneId.systemDefault()).toLocalDateTime()
    }
}

@Dao
interface PositionDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(position: DbPosition)

    @Query("SELECT * FROM position WHERE instrumentId = :id")
    fun positionsByInstrumentId(id: String): Flow<List<PositionAndCurrency>>

    data class PositionAndCurrency(
        @Embedded
        val position: DbPosition,

        @Relation(
            parentColumn = "currencyId",
            entityColumn = "id"
        )
        val currency: DbCurrency
    )
}

fun PositionDao.PositionAndCurrency.toPosition() = Position(
    date = position.date,
    count = position.count,
    price = CurrencyValue(value = position.price, currency = currency.toCurrency())
)