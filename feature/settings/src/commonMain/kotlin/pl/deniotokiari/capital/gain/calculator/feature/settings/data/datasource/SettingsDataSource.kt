package pl.deniotokiari.capital.gain.calculator.feature.settings.data.datasource

import pl.deniotokiari.capital.gain.calculator.RemoteStore
import pl.deniotokiari.capital.gain.calculator.feature.settings.data.Settings

private const val PATH = "settings"

interface SettingsDataSource {
    suspend fun saveSettings(settings: Settings): Result<Unit>

    suspend fun getSettings(): Result<Settings>
}

class SettingsRemoteDataSource(
    private val remoteStore: RemoteStore,
) : SettingsDataSource {
    override suspend fun saveSettings(settings: Settings): Result<Unit> = runCatching {
        remoteStore.putCollection(PATH, listOf(settings), Settings.serializer())
    }

    override suspend fun getSettings(): Result<Settings> = runCatching {
        remoteStore.getCollection(PATH, Settings.serializer()).first()
    }
}