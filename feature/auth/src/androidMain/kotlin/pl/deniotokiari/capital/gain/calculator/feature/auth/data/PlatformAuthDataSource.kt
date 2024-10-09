package pl.deniotokiari.capital.gain.calculator.feature.auth.data

import pl.deniotokiari.capital.gain.calculator.platform.androidios.auth.data.AndroidIosAuthDataSource
import pl.deniotokiari.capital.gain.calculator.platform.common.auth.data.AuthDataSource

actual fun getPlatformAuthDataSource(): AuthDataSource = AndroidIosAuthDataSource()