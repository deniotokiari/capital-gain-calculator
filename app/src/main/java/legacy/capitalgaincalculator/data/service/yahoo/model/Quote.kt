package legacy.capitalgaincalculator.data.service.yahoo.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class Quote(
    @Json(name = "quoteResponse")
    val quoteResponse: QuoteResponse
) {
    @JsonClass(generateAdapter = true)
    data class QuoteResponse(
        @Json(name = "result") val result: List<QuoteResult>
    )

    @JsonClass(generateAdapter = true)
    data class QuoteResult(
        @Json(name = "region") val region: String,
        @Json(name = "currency") val currency: String,
        @Json(name = "symbol") val symbol: String,
        @Json(name = "fullExchangeName") val fullExchangeName: String,
        @Json(name = "regularMarketPrice") val regularMarketPrice: Double
    )
}