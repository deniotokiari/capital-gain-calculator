package legacy.capitalgaincalculator.data.db

import android.content.Context
import androidx.room.Database
import androidx.room.InvalidationTracker
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverter
import androidx.room.TypeConverters
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Single
import java.math.BigDecimal
import java.time.LocalDate
import java.time.format.DateTimeFormatter

class BigDecimalConverter {
    @TypeConverter
    fun fromType(value: BigDecimal): String = value.toPlainString()

    @TypeConverter
    fun toType(value: String): BigDecimal = value.toBigDecimal()
}

class LocalDateConverter {
    private val formatter = DateTimeFormatter.ISO_LOCAL_DATE

    @TypeConverter
    fun fromType(value: LocalDate): String = formatter.format(value)

    @TypeConverter
    fun toType(value: String): LocalDate = LocalDate.from(formatter.parse(value))
}

@Database(
    entities = [
        DbCurrency.Model::class,
        DbPortfolio.Model::class,
        DbInstrument.Model::class,
        DbTicker.Model::class,
        DbPosition.Model::class,
        DbConversionRate.Model::class
    ], version = 1,
    exportSchema = false
)
@TypeConverters(
    DbCurrency.Converter::class,
    DbInstrument.Converter::class,
    BigDecimalConverter::class,
    LocalDateConverter::class
)
abstract class AppDataBase : RoomDatabase() {
    abstract fun portfolioDao(): DbPortfolio.Dao

    abstract fun currencyDao(): DbCurrency.Dao

    abstract fun instrumentDao(): DbInstrument.Dao

    abstract fun tickerDao(): DbTicker.Dao

    abstract fun positionDao(): DbPosition.Dao

    abstract fun conversionRateDao(): DbConversionRate.Dao
}

@Single
fun create(context: Context): AppDataBase = Room.databaseBuilder(context, AppDataBase::class.java, "app_db").build()

@Factory
fun portfolioDao(db: AppDataBase): DbPortfolio.Dao = db.portfolioDao()

@Factory
fun currencyDao(db: AppDataBase): DbCurrency.Dao = db.currencyDao()

@Factory
fun instrumentDao(db: AppDataBase): DbInstrument.Dao = db.instrumentDao()

@Factory
fun tickerDao(db: AppDataBase): DbTicker.Dao = db.tickerDao()

@Factory
fun positionDao(db: AppDataBase): DbPosition.Dao = db.positionDao()

@Factory
fun conversionRateDao(db: AppDataBase): DbConversionRate.Dao = db.conversionRateDao()

@Single
class DataBaseUpdates(
    db: AppDataBase
) {
    private val _conversionRate = MutableStateFlow(Unit)
    val conversionRateUpdates: StateFlow<Unit> = _conversionRate

    init {
        db.invalidationTracker.addObserver(object : InvalidationTracker.Observer("conversion_rate") {
            override fun onInvalidated(tables: Set<String>) {
                if (tables.contains("conversion_rate")) {
                    _conversionRate.value = Unit
                }
            }
        })
    }
}