package pl.deniotokiari.data.asset.datasource

import androidx.room.Dao
import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import pl.deniotokiari.data.asset.model.DbAsset

@Dao
interface AssetRoomDataSource {

}

@Database(
    entities = [DbAsset::class],
    version = 1,
    exportSchema = false
)
@TypeConverters(
    DbAsset.Converter::class
)
abstract class AssetDataBase : RoomDatabase() {
    abstract fun assetDao(): AssetRoomDataSource
}