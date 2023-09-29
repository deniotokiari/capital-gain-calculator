package pl.deniotokiari.capitalgaincalculator.alphavantage.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class SymbolSearchResponse(
    val bestMatches: List<BestMatchesItem>
) {
    @JsonClass(generateAdapter = true)
    data class BestMatchesItem(
        @Json(name = "1. symbol")
        val symbol: String,
        @Json(name = "2. name")
        val name: String,
        @Json(name = "3. type")
        val type: String,
        @Json(name = "4. region")
        val region: String,
        @Json(name = "8. currency")
        val currency: String
    )
}
