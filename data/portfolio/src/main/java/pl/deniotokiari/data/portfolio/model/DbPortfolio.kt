package pl.deniotokiari.data.portfolio.model

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "portfolio")
data class DbPortfolio(
    @PrimaryKey val name: String,
    @ColumnInfo("currency_code") val currencyCode: String
)