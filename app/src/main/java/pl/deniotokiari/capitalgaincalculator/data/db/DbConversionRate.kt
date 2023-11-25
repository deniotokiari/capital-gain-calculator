package pl.deniotokiari.capitalgaincalculator.data.db

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import java.math.BigDecimal

class DbConversionRate {
    @Entity("conversion_rate", primaryKeys = ["from_code", "to_code"])
    data class Model(
        @ColumnInfo("from_code") val fromCode: String,
        @ColumnInfo("to_code") val toCode: String,
        val rate: BigDecimal
    )

    @androidx.room.Dao
    interface Dao {
        @Query("""
            SELECT code FROM
                (SELECT code, count(*) AS count FROM
                    (SELECT conversion_rate.from_code AS code
                    FROM conversion_rate 
                    LEFT JOIN position ON conversion_rate.from_code = position.currency_code
                    WHERE currency_code IS NULL
                    
                    UNION ALL
                    
                    SELECT conversion_rate.to_code AS code
                    FROM conversion_rate 
                    LEFT JOIN position ON conversion_rate.to_code = position.currency_code
                    WHERE currency_code IS NULL
                    
                    UNION ALL
                    
                    SELECT conversion_rate.from_code AS code
                    FROM conversion_rate 
                    LEFT JOIN ticker ON conversion_rate.from_code = ticker.currency_code
                    WHERE currency_code IS NULL
                    
                    UNION ALL
                    
                    SELECT conversion_rate.to_code AS code
                    FROM conversion_rate 
                    LEFT JOIN ticker ON conversion_rate.to_code = ticker.currency_code
                    WHERE currency_code IS NULL
                    
                    UNION ALL
                    
                    SELECT conversion_rate.from_code AS code
                    FROM conversion_rate 
                    LEFT JOIN portfolio ON conversion_rate.from_code = portfolio.currency_code
                    WHERE currency_code IS NULL
                    
                    UNION ALL
                    
                    SELECT conversion_rate.to_code AS code
                    FROM conversion_rate 
                    LEFT JOIN portfolio ON conversion_rate.to_code = portfolio.currency_code
                    WHERE currency_code IS NULL)
                GROUP BY code)
            WHERE count = 6 OR count = 3
        """)
        suspend fun getUnusedRates(): List<String>

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        suspend fun addRate(item: Model)

        @Query("SELECT rate FROM conversion_rate WHERE from_code = :from AND to_code = :to")
        suspend fun rate(from: String, to: String): BigDecimal?

        @Query("DELETE FROM conversion_rate WHERE from_code IN (:items) OR to_code IN (:items)")
        suspend fun deleteRates(items: List<String>)
    }
}