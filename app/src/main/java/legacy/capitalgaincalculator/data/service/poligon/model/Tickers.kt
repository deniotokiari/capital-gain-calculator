package legacy.capitalgaincalculator.data.service.poligon.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class Ticker(
    //@Json(name = "active") val active: Boolean,
    //@Json(name = "cik") val cik: String,
    //@Json(name = "composite_figi") val compositeFigi: String,
    @Json(name = "currency_name") val currencyName: String,
    //@Json(name = "last_updated_utc") val lastUpdatedUtc: String,
    @Json(name = "locale") val locale: String,
    //@Json(name = "market") val market: String,
    @Json(name = "name") val name: String,
    //@Json(name = "primary_exchange") val primaryExchange: String,
    //@Json(name = "share_class_figi") val shareClassFigi: String,
    @Json(name = "ticker") val ticker: String,
    //@Json(name = "type") val type: String
)

fun Ticker.toDataModel(): pl.deniotokiari.capitalgaincalculator.data.model.Ticker.Search =
    pl.deniotokiari.capitalgaincalculator.data.model.Ticker.Search(
        symbol = ticker,
        name = name,
        region = locale,
        currency = currencyName.uppercase()
    )