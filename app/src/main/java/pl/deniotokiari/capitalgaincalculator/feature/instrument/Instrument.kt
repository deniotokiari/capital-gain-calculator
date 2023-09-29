package pl.deniotokiari.capitalgaincalculator.feature.instrument

import androidx.room.Dao
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.PrimaryKey

@Entity(tableName = "instrument")
data class DbInstrument(
    val portfolioId: String,
    val symbolId: String,
    @PrimaryKey
    val id: String = portfolioId + symbolId
)

@Dao
interface InstrumentDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(instrument: DbInstrument)
}