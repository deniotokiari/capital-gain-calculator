package pl.deniotokiari.capitalgaincalculator.data.model

import java.math.BigDecimal
import java.time.LocalDate

data class Position(
    val count: BigDecimal,
    val price: CurrencyValue,
    val date: LocalDate
)