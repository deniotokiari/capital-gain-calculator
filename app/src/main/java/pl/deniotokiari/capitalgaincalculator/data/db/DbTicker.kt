package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.PrimaryKey
import androidx.room.Relation
import androidx.room.TypeConverter
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import java.math.BigDecimal

class DbTicker {
    @Entity(tableName = "ticker")
    data class Model(
        @PrimaryKey val symbol: String,
        @ColumnInfo("currency_code") val currencyCode: String,
        val price: BigDecimal
    )

    class Converter {
        @TypeConverter
        fun fromType(value: BigDecimal): String = value.toPlainString()

        @TypeConverter
        fun toType(value: String): BigDecimal = value.toBigDecimal()
    }

    @androidx.room.Dao
    interface Dao {
        @Insert
        fun addTicker(ticker: Model)

        data class TickerWithCurrency(
            @Embedded val ticker: Model,
            @Relation(parentColumn = "currency_code", entityColumn = "code") val currency: DbCurrency.Model
        )
    }
}

fun Ticker.Search.toDbModel(currency: Currency, price: BigDecimal): DbTicker.Model = DbTicker.Model(
    symbol = symbol,
    currencyCode = currency.code.value,
    price = price
)

fun DbTicker.Dao.TickerWithCurrency.toDataModel(): Ticker = Ticker(
    symbol = ticker.symbol,
    currency = currency.toDataCurrency()
)