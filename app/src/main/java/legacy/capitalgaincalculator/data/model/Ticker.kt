package legacy.capitalgaincalculator.data.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize
import java.math.BigDecimal

data class Ticker(
    val symbol: String,
    val currency: Currency
) {
    @Parcelize
    data class Search(
        val symbol: String,
        val name: String,
        val region: String,
        val currency: String
    ) : Parcelable

    @JvmInline
    value class Price(val value: BigDecimal)
}