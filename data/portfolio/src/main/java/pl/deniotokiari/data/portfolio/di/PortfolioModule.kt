package pl.deniotokiari.data.portfolio.di

import android.content.Context
import androidx.room.Room
import org.koin.core.annotation.ComponentScan
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Module
import org.koin.core.annotation.Single
import pl.deniotokiari.data.portfolio.datasource.PortfolioDataBase
import pl.deniotokiari.data.portfolio.datasource.PortfolioRoomDataSource

@Module
@ComponentScan("pl.deniotokiari.data.portfolio")
class PortfolioModule {
    @Single
    fun portfolioDb(context: Context): PortfolioDataBase =
        Room.databaseBuilder(context, PortfolioDataBase::class.java, "portfolio_db").build()

    @Factory
    fun PortfolioRoomDataSource(db: PortfolioDataBase): PortfolioRoomDataSource = db.portfolioDao()
}