package pl.deniotokiari.capitalgaincalculator.data.repository

import kotlinx.coroutines.flow.Flow
import org.koin.core.annotation.Factory
import pl.deniotokiari.capitalgaincalculator.core.Result
import pl.deniotokiari.capitalgaincalculator.data.datasource.ProfileDataSource
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.DataError

@Factory
class ProfileRepository(
    private val profileDataSource: ProfileDataSource
) {
    suspend fun setProfileCurrency(currency: Currency): Result<Unit, DataError> =
        profileDataSource.setProfileCurrency(currency)

    fun profileCurrency(): Flow<Result<Currency, DataError>> = profileDataSource.profileCurrency()
}