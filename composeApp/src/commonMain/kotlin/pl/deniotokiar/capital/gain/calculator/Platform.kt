package pl.deniotokiar.capital.gain.calculator

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform