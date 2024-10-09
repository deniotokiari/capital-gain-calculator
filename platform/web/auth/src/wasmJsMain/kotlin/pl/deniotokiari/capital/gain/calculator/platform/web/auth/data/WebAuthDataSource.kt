package pl.deniotokiari.capital.gain.calculator.platform.web.auth.data

import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource

class WebAuthDataSource : AuthDataSource {
    override suspend fun test(): String = "Web Auth"
}