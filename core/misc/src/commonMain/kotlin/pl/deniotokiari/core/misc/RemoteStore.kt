package pl.deniotokiari.core.misc

import pl.deniotokiari.capital.gain.calculator.RemoteStore
import pl.deniotokiari.capital.gain.calculator.getPlatformRemoteStore

fun RemoteStore(): RemoteStore = getPlatformRemoteStore()