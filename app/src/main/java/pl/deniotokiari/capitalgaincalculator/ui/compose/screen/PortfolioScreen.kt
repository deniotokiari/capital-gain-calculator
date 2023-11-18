package pl.deniotokiari.capitalgaincalculator.ui.compose.screen

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import org.koin.androidx.compose.koinViewModel
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.AppHeaderWidget
import pl.deniotokiari.capitalgaincalculator.ui.compose.widget.AppHeaderWidgetAction
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.PortfolioViewModel

@Composable
fun PortfolioScreen(
    id: String,
    viewModel: PortfolioViewModel = koinViewModel(parameters = { parametersOf(id) })
) {
    Column(modifier = Modifier.fillMaxSize()) {
        AppHeaderWidget(
            title = id,
            leftAction = AppHeaderWidgetAction.Left.Back
        )

        TextButton(
            onClick = viewModel::onAddTickerCLicked,
            modifier = Modifier.align(Alignment.CenterHorizontally)
        ) {
            Text(text = stringResource(id = R.string.ticker_add))
        }
    }
}