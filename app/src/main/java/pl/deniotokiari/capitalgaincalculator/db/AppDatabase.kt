package pl.deniotokiari.capitalgaincalculator.db

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyDao
import pl.deniotokiari.capitalgaincalculator.currency.DbCurrency
import pl.deniotokiari.capitalgaincalculator.feature.instrument.DbInstrument
import pl.deniotokiari.capitalgaincalculator.feature.instrument.InstrumentDao
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.DbPortfolio
import pl.deniotokiari.capitalgaincalculator.feature.portfolio.PortfolioDao
import pl.deniotokiari.capitalgaincalculator.feature.position.DbPosition
import pl.deniotokiari.capitalgaincalculator.feature.position.PositionDao
import pl.deniotokiari.capitalgaincalculator.feature.symbol.DbSymbol
import pl.deniotokiari.capitalgaincalculator.feature.symbol.SymbolDao

@Database(
    entities = [
        DbCurrency::class,
        DbPortfolio::class,
        DbSymbol::class,
        DbInstrument::class,
        DbPosition::class
    ],
    version = 1
)
@TypeConverters(
    DbCurrency.Converters::class,
    DbPosition.Converters::class
)
abstract class AppDatabase : RoomDatabase() {
    abstract fun currencyDao(): CurrencyDao

    abstract fun portfolioDao(): PortfolioDao

    abstract fun symbolDao(): SymbolDao

    abstract fun instrumentDao(): InstrumentDao

    abstract fun positionDao(): PositionDao
}