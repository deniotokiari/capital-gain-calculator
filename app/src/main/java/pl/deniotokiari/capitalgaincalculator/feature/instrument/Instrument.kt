package pl.deniotokiari.capitalgaincalculator.feature.instrument

import androidx.room.Dao
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.PrimaryKey
import androidx.room.Query

data class Instrument(
    val portfolioId: String,
    val symbolId: String,
    val id: String
)

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

    @Query("SELECT * FROM instrument WHERE portfolioId = :portfolioId AND symbolId = :symbolId")
    suspend fun getBySymbolIdAndPortfolioId(symbolId: String, portfolioId: String): DbInstrument
}

fun DbInstrument.toInstrument() = Instrument(
    portfolioId = portfolioId,
    symbolId = symbolId,
    id = id
)