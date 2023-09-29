package pl.deniotokiari.capitalgaincalculator.alphavantage

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.runBlocking

interface AlphaVantageApiTokenRepository {
    val token: String

    fun getToken(): Flow<String?>

    suspend fun setToken(token: String)
}

class AlphaVantageApiTokenRepositoryImpl(
    private val dataStore: DataStore<Preferences>
) : AlphaVantageApiTokenRepository {

    private val alphaVantageApiTokenKey = stringPreferencesKey("alphaVantageApiTokenKey")

    override fun getToken(): Flow<String?> = dataStore.data.map {
        it[alphaVantageApiTokenKey]
    }

    override suspend fun setToken(token: String) {
        dataStore.edit { it[alphaVantageApiTokenKey] = token }
    }

    override val token: String
        get() = runBlocking { dataStore.data.first()[alphaVantageApiTokenKey]!! }
}