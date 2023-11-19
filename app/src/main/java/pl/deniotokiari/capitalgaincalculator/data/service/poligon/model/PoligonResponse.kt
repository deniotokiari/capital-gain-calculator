package pl.deniotokiari.capitalgaincalculator.data.service.poligon.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class PoligonResponse<T>(
    //@Json(name = "count") val count: Int,
    //@Json(name = "next_url") val nextUrl: String,
    //@Json(name = "request_id") val requestId: String,
    //@Json(name = "status") val status: String,
    @Json(name = "results") val results: T
)