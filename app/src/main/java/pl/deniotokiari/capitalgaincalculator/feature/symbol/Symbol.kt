package pl.deniotokiari.capitalgaincalculator.feature.symbol

import android.os.Parcelable
import androidx.room.Dao
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.PrimaryKey
import androidx.room.Relation
import kotlinx.parcelize.Parcelize
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.currency.DbCurrency
import pl.deniotokiari.capitalgaincalculator.currency.toCurrency
import pl.deniotokiari.capitalgaincalculator.currency.toDbCurrency

@Parcelize
data class Symbol(
    val name: String,
    val symbol: String,
    val region: String,
    val type: String,
    val currency: Currency
) : Parcelable

@Entity(tableName = "symbol")
data class DbSymbol(
    val name: String,
    val symbol: String,
    val region: String,
    val type: String,
    val currencyId: String,
    @PrimaryKey
    val id: String = name + symbol + region + type
)

@Dao
interface SymbolDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(symbol: DbSymbol)

    data class SymbolAndCurrency(
        @Embedded
        val symbol: DbSymbol,

        @Relation(
            parentColumn = "currencyId",
            entityColumn = "id"
        )
        val currency: DbCurrency
    )
}

fun Symbol.toSearchResultString() = "$symbol - $name - ${currency.code} - $region"

fun Symbol.toDbSymbol() = DbSymbol(
    name = name,
    symbol = symbol,
    region = region,
    type = type,
    currencyId = currency.toDbCurrency().id
)

fun SymbolDao.SymbolAndCurrency.toSymbol(): Symbol = Symbol(
    name = symbol.name,
    symbol = symbol.symbol,
    region = symbol.region,
    type = symbol.type,
    currency = currency.toCurrency()
)