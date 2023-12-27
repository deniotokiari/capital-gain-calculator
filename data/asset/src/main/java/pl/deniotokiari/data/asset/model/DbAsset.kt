package pl.deniotokiari.data.asset.model

import androidx.room.Entity
import androidx.room.TypeConverter

@Entity(tableName = "asset", primaryKeys = ["id", ""])
data class DbAsset(
    val id: String,
    val type: Type,
    val portfolioId: String

) {
    enum class Type {
        Ticker, Currency
    }

    class Converter {
        @TypeConverter
        fun fromType(value: Type): Int = value.ordinal

        @TypeConverter
        fun toType(value: Int): Type = enumValues<Type>()[value]
    }
}