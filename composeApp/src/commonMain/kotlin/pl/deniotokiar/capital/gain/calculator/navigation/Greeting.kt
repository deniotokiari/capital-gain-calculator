package pl.deniotokiar.capital.gain.calculator.navigation

import kotlinx.serialization.Serializable

@Serializable
object Greeting : Route {
    override val name: String = "Greeting"
}