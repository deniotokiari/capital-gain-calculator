package pl.deniotokiari.capitalgaincalculator.data.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize
import java.math.BigDecimal
import java.time.LocalDate

@Parcelize
data class Position(
    val count: BigDecimal,
    val price: CurrencyValue,
    val date: LocalDate
) : Parcelable