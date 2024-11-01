package pl.deniotokiari.capital.gain.calculator.feature.settings.data

import kotlinx.serialization.Serializable
import pl.deniotokiari.capital.gain.calculator.EntityWithId
import pl.deniotokiari.capital.gain.calculator.gateway.feature.currency.GatewayCurrency

@Serializable
data class Settings(
    override val id: String,
    val profileCurrency: GatewayCurrency,
) : EntityWithId