package pl.deniotokiari.capitalgaincalculator.data.service.alphavantage.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class CurrencyExchangeRate(
    @Json(name = "Realtime Currency Exchange Rate") val rate: RealtimeCurrencyExchangeRate
) {
    @JsonClass(generateAdapter = true)
    data class RealtimeCurrencyExchangeRate(
        @Json(name = "5. Exchange Rate") val exchangeRate: String
    )
}