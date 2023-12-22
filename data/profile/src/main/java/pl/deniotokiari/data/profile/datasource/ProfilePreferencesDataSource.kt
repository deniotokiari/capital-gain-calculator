package pl.deniotokiari.data.profile.datasource

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory

@Factory
class ProfilePreferencesDataSource(
    private val dataStore: DataStore<Preferences>
) {
    suspend fun setProfileCurrency(currency: String) = dataStore.edit {
        it[KEY_PROFILE_CURRENCY] = currency
    }

    suspend fun isProfileCurrencySet(): Boolean = dataStore.data.map { it.contains(KEY_PROFILE_CURRENCY) }.first()

    fun getProfileCurrency(): Flow<String> = dataStore.data
        .map { it[KEY_PROFILE_CURRENCY] }
        .filterNotNull()

    companion object {
        private val KEY_PROFILE_CURRENCY = stringPreferencesKey("profile_currency")
    }
}