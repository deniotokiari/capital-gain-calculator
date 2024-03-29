package pl.deniotokiari.domain.model

import pl.deniotokiari.data.currency.model.Currency as DataCurrency

data class Currency(
    val code: String,
    val name: String?
)

fun DataCurrency.toDomainModel(): Currency = Currency(
    code = code,
    name = name
)

fun List<DataCurrency>.toDomainModelList(): List<Currency> = map { it.toDomainModel() }
