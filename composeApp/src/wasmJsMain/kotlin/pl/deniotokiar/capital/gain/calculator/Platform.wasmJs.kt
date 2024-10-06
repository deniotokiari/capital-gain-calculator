package pl.deniotokiar.capital.gain.calculator

import pl.deniotokiar.capital.gain.calculator.presentation.User

class WasmPlatform : Platform {
    override suspend fun getUsers(): List<User> = listOf(
        User("Web", 10)
    )
}

actual fun getPlatform(): Platform = WasmPlatform()