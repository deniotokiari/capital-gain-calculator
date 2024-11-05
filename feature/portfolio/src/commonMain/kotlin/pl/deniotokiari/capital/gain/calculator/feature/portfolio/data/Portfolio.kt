package pl.deniotokiari.capital.gain.calculator.feature.portfolio.data

import pl.deniotokiari.capital.gain.calculator.WithId

data class Portfolio(
    override val id: String,
    val name: String,
) : WithId
