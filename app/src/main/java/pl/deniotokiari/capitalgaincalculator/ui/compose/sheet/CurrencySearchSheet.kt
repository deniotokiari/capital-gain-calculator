package pl.deniotokiari.capitalgaincalculator.ui.compose.sheet

import androidx.compose.runtime.Composable
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