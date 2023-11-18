@file:OptIn(ExperimentalMaterialNavigationApi::class)

package pl.deniotokiari.capitalgaincalculator.ui.activity

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.EnterTransition
import androidx.compose.animation.ExitTransition
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.rememberNavController
import com.google.accompanist.navigation.material.ExperimentalMaterialNavigationApi
import com.google.accompanist.navigation.material.ModalBottomSheetLayout
import com.google.accompanist.navigation.material.rememberBottomSheetNavigator
import org.koin.android.ext.android.get
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppNavigation
import pl.deniotokiari.capitalgaincalculator.ui.theme.CapitalGainCalculatorTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val appNavigation = get<AppNavigation>()

        setContent {
            val bottomSheetNavigator = rememberBottomSheetNavigator()
            val navController = rememberNavController(bottomSheetNavigator)

            appNavigation.setController(navController)

            CapitalGainCalculatorTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    ModalBottomSheetLayout(
                        bottomSheetNavigator,
                        sheetBackgroundColor = Color.Transparent,
                        sheetContentColor = Color.Transparent,
                        scrimColor = Color.Transparent,
                        sheetElevation = 0.dp
                    ) {
                        NavHost(
                            navController = navController,
                            startDestination = appNavigation.startDestination,
                            enterTransition = { EnterTransition.None },
                            exitTransition = { ExitTransition.None },
                            builder = appNavigation::navigationGraph
                        )
                    }
                }
            }
        }
    }
}