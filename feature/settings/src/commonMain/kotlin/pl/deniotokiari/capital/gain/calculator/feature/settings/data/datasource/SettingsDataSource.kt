package pl.deniotokiari.capital.gain.calculator.feature.settings.data.datasource

import pl.deniotokiari.capital.gain.calculator.RemoteStore
import pl.deniotokiari.capital.gain.calculator.feature.settings.data.SettingsHolder
import pl.deniotokiari.capital.gain.calculator.gateway.feature.auth.AuthGateway
import pl.deniotokiari.core.misc.Result
import pl.deniotokiari.core.misc.error
import pl.deniotokiari.core.misc.ok

interface SettingsDataSource {
    suspend fun saveSettings(settings: SettingsHolder): Result<Unit, Exception>

    suspend fun getSettings(): Result<SettingsHolder, Exception>
}

class SettingsRemoteDataSource(
    private val remoteStore: RemoteStore,
    private val authGateway: AuthGateway,
) : SettingsDataSource {
    override suspend fun saveSettings(settings: SettingsHolder): Result<Unit, Exception> = authGateway
        .getUserId()
        .then { userId ->
            runCatching {
                remoteStore.putItem("users/$userId", settings, SettingsHolder.serializer())
            }.fold(
                onSuccess = { Unit.ok() },
                onFailure = { Exception(it).error() }
            )
        }

    override suspend fun getSettings(): Result<SettingsHolder, Exception> = authGateway
        .getUserId()
        .then { userId ->
            runCatching {
                remoteStore.getItem("users/$userId", SettingsHolder.serializer())
            }.fold(
                onSuccess = { it.ok() },
                onFailure = { Exception(it).error() }
            )
        }
}
