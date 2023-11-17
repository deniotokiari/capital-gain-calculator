@file:OptIn(ExperimentalMaterialNavigationApi::class)

package pl.deniotokiari.capitalgaincalculator.core

import androidx.compose.runtime.compositionLocalOf
import androidx.navigation.NavHostController
import com.google.accompanist.navigation.material.BottomSheetNavigator
import com.google.accompanist.navigation.material.ExperimentalMaterialNavigationApi

val LocalNavController = compositionLocalOf<NavHostController> { error("no default navController") }

val LocalBottomSheetNavController =
    compositionLocalOf<BottomSheetNavigator> { error("no default bottom navController") }