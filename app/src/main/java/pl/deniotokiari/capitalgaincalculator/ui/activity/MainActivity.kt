@file:OptIn(ExperimentalMaterialNavigationApi::class, ExperimentalMaterial3Api::class)

package pl.deniotokiari.capitalgaincalculator.ui.activity

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.ColumnScope
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.navigation.NamedNavArgument
import androidx.navigation.NavBackStackEntry
import androidx.navigation.NavDeepLink
import androidx.navigation.NavGraphBuilder
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.google.accompanist.navigation.material.ExperimentalMaterialNavigationApi
import com.google.accompanist.navigation.material.ModalBottomSheetLayout
import com.google.accompanist.navigation.material.bottomSheet
import com.google.accompanist.navigation.material.rememberBottomSheetNavigator
import pl.deniotokiari.capitalgaincalculator.core.LocalBottomSheetNavController
import pl.deniotokiari.capitalgaincalculator.core.LocalNavController
import pl.deniotokiari.capitalgaincalculator.ui.compose.AddPortfolio
import pl.deniotokiari.capitalgaincalculator.ui.compose.HomeScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.InitProfileCurrency
import pl.deniotokiari.capitalgaincalculator.ui.theme.CapitalGainCalculatorTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            CapitalGainCalculatorTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    CompositionLocalProvider(LocalBottomSheetNavController provides rememberBottomSheetNavigator()) {
                        CompositionLocalProvider(
                            LocalNavController provides rememberNavController(
                                LocalBottomSheetNavController.current
                            )
                        ) {
                            ModalBottomSheetLayout(
                                LocalBottomSheetNavController.current,
                                sheetBackgroundColor = Color.Transparent,
                                sheetContentColor = Color.Transparent,
                                scrimColor = Color.Transparent,
                                sheetElevation = 0.dp
                            ) {
                                NavHost(
                                    navController = LocalNavController.current,
                                    startDestination = "init_profile_currency"
                                ) {
                                    composable("home") { HomeScreen() }
                                    composable("about") { }
                                    composable("settings") { }
                                    composable("init_profile_currency") { InitProfileCurrency() }
                                    sheet("portfolio_add") { AddPortfolio() }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

fun NavGraphBuilder.sheet(
    route: String,
    arguments: List<NamedNavArgument> = emptyList(),
    deepLinks: List<NavDeepLink> = emptyList(),
    content: @Composable ColumnScope.(backstackEntry: NavBackStackEntry) -> Unit
) {
    bottomSheet(route, arguments, deepLinks) {
        val controller = LocalNavController.current

        ModalBottomSheet(onDismissRequest = {
            controller.popBackStack()
        }) {
            content(this, it)
        }
    }
}