package pl.deniotokiari.capitalgaincalculator.data.service.yahoo.model

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker

@JsonClass(generateAdapter = true)
data class Autocomplete(
    @Json(name = "ResultSet") val resultSet: ResultSet
) {
    @JsonClass(generateAdapter = true)
    data class ResultSet(
        @Json(name = "Result") val result: List<Result>
    ) {
        @JsonClass(generateAdapter = true)
        data class Result(
            //@Json(name = "exch") val exch: String,
            //@Json(name = "exchDisp") val exchDisp: String,
            @Json(name = "name") val name: String,
            @Json(name = "symbol") val symbol: String,
            //@Json(name = "type") val type: String,
            //@Json(name = "typeDisp") val typeDisp: String
        )
    }
}

fun Autocomplete.ResultSet.Result.toDataModel(quote: Quote.QuoteResult?): Ticker.Search = Ticker.Search(
    symbol = symbol,
    name = name,
    region = quote?.fullExchangeName ?: "",
    currency = quote?.currency ?: ""
)