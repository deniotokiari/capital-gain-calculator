package pl.deniotokiari.feature.portfolio.presentation

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import org.koin.androidx.compose.koinViewModel
import org.koin.compose.koinInject
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.core.ui.widget.AppHeaderWidget
import pl.deniotokiari.core.ui.widget.AppHeaderWidgetAction
import pl.deniotokiari.feature.portfolio.viewmodel.PortfolioViewModel
import pl.deniotokiari.navigation.AppNavigation

@Composable
fun PortfolioScreen(
    id: String,
    viewModel: PortfolioViewModel = koinViewModel(parameters = { parametersOf(id) }),
    appNavigation: AppNavigation = koinInject()
) {
    Column(
        modifier = Modifier.fillMaxSize()
    ) {
        AppHeaderWidget(
            title = id,
            leftAction = AppHeaderWidgetAction.Left.Back(appNavigation::navigateBack),
            action = appNavigation::navigateToSettings
        )
    }
}