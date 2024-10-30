package pl.deniotokiari.capital.gain.calculator.feature.currency.data.model

import kotlinx.serialization.Serializable

@Serializable
sealed interface Currency {
    val name: String
    val code: String

    @Serializable
    data class Physical(
        override val name: String,
        override val code: String
    ) : Currency

    @Serializable
    data class Digital(
        override val name: String,
        override val code: String
    ) : Currency
}