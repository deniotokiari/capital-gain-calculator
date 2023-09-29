package pl.deniotokiari.capitalgaincalculator.feature.profile

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.usecase.GetCurrencyByCodeUseCase

interface ProfileRepository {
    fun getProfileCurrency(): Flow<Currency?>

    suspend fun setProfileCurrency(currency: Currency)
}

class ProfileRepositoryImpl(
    private val dataStore: DataStore<Preferences>,
    private val getCurrencyByCodeUseCase: GetCurrencyByCodeUseCase
) : ProfileRepository {

    private val profileCurrencyKey = stringPreferencesKey("profileCurrencyKey")

    override fun getProfileCurrency(): Flow<Currency?> = dataStore.data.map {
        it[profileCurrencyKey]?.let { code -> getCurrencyByCodeUseCase(code) }
    }

    override suspend fun setProfileCurrency(currency: Currency) {
        dataStore.edit { it[profileCurrencyKey] = currency.code }
    }
}