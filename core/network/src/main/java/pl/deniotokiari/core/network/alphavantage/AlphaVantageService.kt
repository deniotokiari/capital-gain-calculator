package pl.deniotokiari.core.network.alphavantage

import retrofit2.http.GET

interface AlphaVantageService {
    @GET("/physical_currency_list")
    suspend fun physicalCurrencyList(): String

    @GET("/digital_currency_list")
    suspend fun digitalCurrencyList(): String
}