package pl.deniotokiari.data.currency.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverter

@Entity(tableName = "currency")
data class DbCurrency(
    @PrimaryKey val code: String,
    val name: String?,
    val type: Type
) {
    enum class Type {
        Physical,
        Digital
    }

    class Converter {
        @TypeConverter
        fun fromType(value: Type): Int = value.ordinal

        @TypeConverter
        fun toType(value: Int): Type = enumValues<Type>()[value]
    }
}