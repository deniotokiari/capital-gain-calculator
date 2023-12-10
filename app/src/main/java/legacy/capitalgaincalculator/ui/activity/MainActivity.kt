@file:OptIn(ExperimentalMaterialNavigationApi::class)

package legacy.capitalgaincalculator.ui.activity

import androidx.activity.ComponentActivity
import com.google.accompanist.navigation.material.ExperimentalMaterialNavigationApi

class MainActivity : ComponentActivity() {
    /*override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val appNavigation = get<AppHostNavigation>()

        setContent {
            val bottomSheetNavigator = rememberBottomSheetNavigator()
            val navController = rememberNavController(bottomSheetNavigator)

            appNavigation.controller = navController

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
                            startDestination = appNavigation.startDestination.name,
                            enterTransition = { EnterTransition.None },
                            exitTransition = { ExitTransition.None },
                            builder = appNavigation::navigationGraph
                        )
                    }
                }
            }
        }
    }*/
}