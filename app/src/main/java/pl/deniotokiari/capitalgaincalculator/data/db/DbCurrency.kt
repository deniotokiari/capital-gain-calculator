package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.Entity
import androidx.room.Insert
import androidx.room.PrimaryKey
import androidx.room.Query
import androidx.room.TypeConverter
import kotlinx.coroutines.flow.Flow
import pl.deniotokiari.capitalgaincalculator.data.model.Currency

class DbCurrency {
    @Entity(tableName = "currency")
    data class Model(
        @PrimaryKey val code: String,
        val name: String,
        val type: Type
    )

    enum class Type {
        Physical,
        Digital
    }

    @androidx.room.Dao
    interface Dao {
        @Query("SELECT * FROM currency")
        fun currencies(): Flow<List<Model>>

        @Insert
        suspend fun addCurrencies(currencies: List<Model>)

        @Query("SELECT * FROM currency WHERE code = :code")
        suspend fun currencyByCode(code: String): Model
    }

    class Converter {
        @TypeConverter
        fun fromType(value: Type): Int = value.ordinal

        @TypeConverter
        fun toType(value: Int): Type = enumValues<Type>()[value]
    }
}

fun DbCurrency.Type.toDataType(): Currency.Type = enumValues<Currency.Type>()[ordinal]

fun DbCurrency.Model.toDataModel(): Currency = Currency(
    name = name,
    code = Currency.Code(code),
    type = type.toDataType()
)

fun Currency.Type.toDbType(): DbCurrency.Type = enumValues<DbCurrency.Type>()[ordinal]

fun Currency.toDbCurrency(): DbCurrency.Model = DbCurrency.Model(
    code = code.value,
    name = name,
    type = type.toDbType()
)