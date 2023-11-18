package pl.deniotokiari.capitalgaincalculator.data.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

data class Ticker(
    val symbol: String,
    val name: String,
    val region: String,
    val currency: Currency
) {
    @Parcelize
    data class Search(
        val symbol: String,
        val name: String,
        val region: String,
        val currency: String
    ) : Parcelable
}