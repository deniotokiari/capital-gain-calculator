package pl.deniotokiari.data.currency.di

import android.content.Context
import androidx.room.Room
import org.koin.core.annotation.ComponentScan
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Module
import org.koin.core.annotation.Single
import pl.deniotokiari.data.currency.datasource.CurrencyDataBase
import pl.deniotokiari.data.currency.datasource.CurrencyRoomDataSource

@Module
@ComponentScan("pl.deniotokiari.data.currency")
class CurrencyDataModule {
    @Single
    fun currencyDb(context: Context): CurrencyDataBase =
        Room.databaseBuilder(context, CurrencyDataBase::class.java, "currency_db").build()

    @Factory
    fun currencyRoomDataSource(db: CurrencyDataBase): CurrencyRoomDataSource = db.currencyDao()
}