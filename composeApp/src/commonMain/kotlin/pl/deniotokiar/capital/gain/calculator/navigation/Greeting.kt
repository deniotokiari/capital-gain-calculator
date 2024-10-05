package pl.deniotokiar.capital.gain.calculator.navigation

import kotlinx.serialization.Serializable
import pl.deniotokiari.core.navigation.Route

@Serializable
object Greeting : Route {
    override val name: String = "Greeting"
}