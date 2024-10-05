package pl.deniotokiar.capital.gain.calculator.navigation

import kotlinx.serialization.Serializable
import pl.deniotokiari.core.navigation.Route

@Serializable
object Home : Route {
    override val name: String = "Home"
}