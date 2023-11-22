package pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class Quote(
    @Json(name = "Global Quote") val globalQuote: GlobalQuote
) {

    @JsonClass(generateAdapter = true)
    data class GlobalQuote(
        @Json(name = "05. price") val price: String
    )
}