package pl.deniotokiar.capital.gain.calculator

import pl.deniotokiar.capital.gain.calculator.presentation.User

interface Platform {
    suspend fun getUsers(): List<User>
}

expect fun getPlatform(): Platform