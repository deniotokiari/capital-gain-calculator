package legacy.capitalgaincalculator.data.service.alphavantage.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker

@JsonClass(generateAdapter = true)
data class SymbolSearch(
    @Json(name = "bestMatches")
    val bestMatches: List<Match>
) {
    @JsonClass(generateAdapter = true)
    data class Match(
        @Json(name = "1. symbol") val symbol: String,
        @Json(name = "2. name") val name: String,
        //@Json(name = "3. type") val type: String,
        @Json(name = "4. region") val region: String,
        //@Json(name = "5. marketOpen") val marketOpen: String,
        //@Json(name = "6. marketClose") val marketClose: String,
        //@Json(name = "7. timezone") val timeZone: String,
        @Json(name = "8. currency") val currency: String,
        //@Json(name = "9. matchScore") val matchScore: String
    )
}

fun SymbolSearch.Match.toDataModel(): Ticker.Search = Ticker.Search(
    symbol = symbol,
    name = name,
    region = region,
    currency = currency
)