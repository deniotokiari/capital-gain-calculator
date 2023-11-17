package pl.deniotokiari.capitalgaincalculator.data.datasource

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.core.failed
import pl.deniotokiari.capitalgaincalculator.core.success
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError
import pl.deniotokiari.capitalgaincalculator.data.model.toLocalModel

interface ProfileDataSource {
    suspend fun setProfileCurrency(currency: Currency): Result<Unit, DataError>

    fun profileCurrency(): Flow<Result<Currency?, DataError>>

    suspend fun hasCurrency(): Boolean
}

@Factory
internal class ProfileLocalDataSource(
    private val dataStore: DataStore<Preferences>
) : ProfileDataSource {
    override suspend fun setProfileCurrency(currency: Currency): Result<Unit, DataError> = runCatching {
        dataStore.edit {
            it[KEY_PROFILE_CURRENCY] = currency.toLocalModel()
        }
    }.fold(
        onSuccess = { Unit.success() },
        onFailure = { DataError(it).failed() }
    )

    override fun profileCurrency(): Flow<Result<Currency?, DataError>> = dataStore.data.map {
        it[KEY_PROFILE_CURRENCY]?.let(Currency::fromLocalModel).success()
    }

    override suspend fun hasCurrency(): Boolean =
        dataStore.data.firstOrNull()?.get(KEY_PROFILE_CURRENCY) != null

    companion object {
        private val KEY_PROFILE_CURRENCY = stringPreferencesKey("profile_currency")
    }
}