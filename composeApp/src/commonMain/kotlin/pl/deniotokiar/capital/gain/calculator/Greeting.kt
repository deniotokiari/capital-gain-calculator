package pl.deniotokiar.capital.gain.calculator

class Greeting(
    private val platform: Platform,
) {
    fun greet(): String {
        return "Hello, ${platform.name}!"
    }
}