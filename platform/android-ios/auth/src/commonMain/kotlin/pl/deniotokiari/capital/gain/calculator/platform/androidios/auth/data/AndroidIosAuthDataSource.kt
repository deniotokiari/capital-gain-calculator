package pl.deniotokiari.capital.gain.calculator.platform.androidios.auth.data

import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource

class AndroidIosAuthDataSource : AuthDataSource {
    override suspend fun test(): String = "Android-iOS Auth"
}