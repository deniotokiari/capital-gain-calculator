package pl.deniotokiari.capital.gain.calculator.feature.auth.data

import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource
import pl.deniotokiari.capital.gain.calculator.platform.web.auth.data.WebAuthDataSource

actual fun getPlatformAuthDataSource(): AuthDataSource = WebAuthDataSource()