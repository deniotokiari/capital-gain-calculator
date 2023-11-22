package pl.deniotokiari.capitalgaincalculator.data.service.poligon.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class PreviousClose(
    @Json(name = "c") val close: Double
)