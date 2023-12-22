package pl.deniotokiari.data.profile.repository

import kotlinx.coroutines.flow.Flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.data.profile.datasource.ProfilePreferencesDataSource

@Factory
class ProfileRepository(
    private val profilePreferencesDataSource: ProfilePreferencesDataSource
) {
    fun getProfileCurrency(): Flow<String> = profilePreferencesDataSource.getProfileCurrency()

    suspend fun isProfileCurrencySet(): Boolean = profilePreferencesDataSource.isProfileCurrencySet()

    suspend fun setProfileCurrency(currency: String) {
        profilePreferencesDataSource.setProfileCurrency(currency)
    }
}