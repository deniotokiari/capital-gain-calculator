package pl.deniotokiari.capital.gain.calculator.feature.currency.data.model

sealed interface Currency {
    val name: String
    val code: String

    data class Physical(
        override val name: String,
        override val code: String
    ) : Currency

    data class Digital(
        override val name: String,
        override val code: String
    ) : Currency
}