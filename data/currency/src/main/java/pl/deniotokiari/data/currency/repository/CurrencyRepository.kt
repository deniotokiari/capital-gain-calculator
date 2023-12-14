package pl.deniotokiari.data.currency.repository

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import org.koin.core.annotation.Single
import pl.deniotokiari.core.common.Failed
import pl.deniotokiari.core.common.Result
import pl.deniotokiari.core.common.Success
import pl.deniotokiari.data.currency.datasource.CurrencyAlphaVantageDataSource
import pl.deniotokiari.data.currency.datasource.CurrencyRoomDataSource
import pl.deniotokiari.data.currency.model.Currency
import pl.deniotokiari.data.currency.model.CurrencyError
import pl.deniotokiari.data.currency.model.DbCurrency

@Single
class CurrencyRepository(
    private val alphaVantageDataSource: CurrencyAlphaVantageDataSource,
    private val roomDataSource: CurrencyRoomDataSource
) {
    suspend fun updateCurrencies(): Result<Unit, CurrencyError> = runCatching {
        fun mapper(code: String, name: String, type: DbCurrency.Type) = DbCurrency(
            code = code,
            name = name,
            type = type
        )

        val physical = alphaVantageDataSource.getPhysicalCurrencies()
        val digital = alphaVantageDataSource.getDigitalCurrencies()

        (physical.map { (code, name) -> mapper(code, name, DbCurrency.Type.Physical) }
                +
                digital.map { (code, name) -> mapper(code, name, DbCurrency.Type.Digital) }).let { items ->
            roomDataSource.addCurrencies(items)
        }
    }.fold(
        onSuccess = { Success(Unit) },
        onFailure = { Failed(CurrencyError(it)) }
    )


    fun getCurrencies(): Flow<List<Currency>> = roomDataSource.getCurrencies().map { it.toCurrenciesList() }
}

private fun DbCurrency.Type.toCurrencyType(): Currency.Type = enumValues<Currency.Type>()[ordinal]

private fun List<DbCurrency>.toCurrenciesList(): List<Currency> = map { (code, name, type) ->
    Currency(
        code = code,
        name = name,
        type = type.toCurrencyType()
    )
}