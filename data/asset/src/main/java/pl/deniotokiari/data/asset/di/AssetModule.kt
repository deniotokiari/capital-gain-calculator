package pl.deniotokiari.data.asset.di

import android.content.Context
import androidx.room.Room
import org.koin.core.annotation.ComponentScan
import org.koin.core.annotation.Factory
import org.koin.core.annotation.Module
import org.koin.core.annotation.Single
import pl.deniotokiari.data.asset.datasource.AssetDataBase
import pl.deniotokiari.data.asset.datasource.AssetRoomDataSource

@Module
@ComponentScan("pl.deniotokiari.data.asset")
class AssetModule {
    @Single
    fun assetDb(context: Context): AssetDataBase =
        Room.databaseBuilder(context, AssetDataBase::class.java, "asset_db").build()

    @Factory
    fun assetRoomDataSource(db: AssetDataBase): AssetRoomDataSource = db.assetDao()
}