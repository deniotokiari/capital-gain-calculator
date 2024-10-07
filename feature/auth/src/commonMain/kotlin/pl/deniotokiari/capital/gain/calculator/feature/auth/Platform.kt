package pl.deniotokiari.capital.gain.calculator.feature.auth

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform