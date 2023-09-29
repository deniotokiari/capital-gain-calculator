package pl.deniotokiari.capitalgaincalculator.currency

import android.os.Parcelable
import androidx.room.Dao
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.PrimaryKey
import androidx.room.Query
import androidx.room.TypeConverter
import kotlinx.coroutines.flow.Flow
import kotlinx.parcelize.Parcelize

@Parcelize
sealed class Currency(open val code: String, open val name: String) : Parcelable {
    data class Fiat(override val code: String, override val name: String) : Currency(code, name)
    data class Crypto(override val code: String, override val name: String) : Currency(code, name)

    fun isUsd() = isUsd(code)

    companion object {
        fun isUsd(value: String) = value.equals("USD", ignoreCase = true)
    }
}

data class CurrencyValue(
    val value: Double,
    val currency: Currency
)

@Entity(tableName = "currency")
data class DbCurrency(
    val code: String,
    val name: String,
    val type: Type,
    @PrimaryKey
    val id: String = code + name
) {
    enum class Type { FIAT, CRYPTO }

    class Converters {
        @TypeConverter
        fun fromType(type: Type): Int = type.ordinal

        @TypeConverter
        fun toType(index: Int): Type = Type.values()[index]
    }
}

@Dao
interface CurrencyDao {
    @Query("SELECT * FROM currency")
    fun getAll(): Flow<List<DbCurrency>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(items: List<DbCurrency>)

    @Query("DELETE FROM currency")
    suspend fun removeAll()

    @Query("SELECT * FROM currency WHERE code = :code")
    suspend fun getByCode(code: String): DbCurrency
}

fun DbCurrency.toCurrency(): Currency = when (type) {
    DbCurrency.Type.FIAT -> Currency.Fiat(code = code, name = name)
    DbCurrency.Type.CRYPTO -> Currency.Crypto(code = code, name = name)
}

fun Currency.toDbCurrency(): DbCurrency = when (this) {
    is Currency.Crypto -> DbCurrency(code = code, name = name, type = DbCurrency.Type.CRYPTO)
    is Currency.Fiat -> DbCurrency(code = code, name = name, type = DbCurrency.Type.FIAT)
}

fun Currency.toUiString() = "$name ($code)"