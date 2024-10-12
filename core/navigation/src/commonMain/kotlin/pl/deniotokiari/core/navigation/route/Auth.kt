package pl.deniotokiari.core.navigation.route

import kotlinx.serialization.Serializable

@Serializable
data object AuthLogin

@Serializable
data object AuthSignup

enum class AuthType {
    Login,
    Signup,
}