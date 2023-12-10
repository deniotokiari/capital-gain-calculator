package legacy.capitalgaincalculator.ui.compose.sheet

import androidx.compose.runtime.Composable
import legacy.capitalgaincalculator.ui.navigation.AppHostNavigation
import org.koin.compose.koinInject
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.CurrenciesListWithSearchWidget
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation

@Composable
fun CurrencySearchSheet(
    appNavigation: AppHostNavigation = koinInject()
) {
    CurrenciesListWithSearchWidget(
        onCurrencySelected = {
            appNavigation.popBackStack(it)
        }
    )
}