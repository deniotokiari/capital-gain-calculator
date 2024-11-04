package pl.deniotokiari.capital.gain.calculator.feature.settings.data.datasource

import pl.deniotokiari.capital.gain.calculator.RemoteStore
import pl.deniotokiari.capital.gain.calculator.feature.settings.data.Settings
import pl.deniotokiari.capital.gain.calculator.gateway.feature.auth.AuthGateway

interface SettingsDataSource {
    suspend fun saveSettings(settings: Settings): Result<Unit>

    suspend fun getSettings(): Result<Settings>
}

class SettingsRemoteDataSource(
    private val remoteStore: RemoteStore,
    private val authGateway: AuthGateway,
) : SettingsDataSource {
    override suspend fun saveSettings(settings: Settings): Result<Unit> = runCatching {
        val userId = authGateway.getUserId().getOrNull() ?: error("Something went wrong")

        remoteStore.putItem("users/$userId", settings, Settings.serializer())
    }

    override suspend fun getSettings(): Result<Settings> = runCatching {
        val userId = authGateway.getUserId().getOrNull() ?: error("Something went wrong")

        remoteStore.getItem("users/$userId", Settings.serializer())
    }
}
