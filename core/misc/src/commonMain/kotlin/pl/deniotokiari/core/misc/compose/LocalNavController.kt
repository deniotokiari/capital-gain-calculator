package pl.deniotokiari.core.misc.compose

import androidx.compose.runtime.compositionLocalOf
import androidx.navigation.NavController

val LocalNavController = compositionLocalOf<NavController?> { null }