package pl.deniotokiari.capital.gain.calculator.feature.home.presentation.compose

import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Info
import androidx.compose.material.icons.outlined.Settings
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import org.koin.compose.koinInject
import org.koin.compose.viewmodel.koinViewModel
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.HomeUiState
import pl.deniotokiari.capital.gain.calculator.feature.home.presentation.HomeViewModel
import pl.deniotokiari.capital.gain.calculator.gateway.feature.portfolio.PortfolioUiGateway
import pl.deniotokiari.capital.gain.calculator.uikit.compose.ApplicationTopBar

@Composable
fun HomeScreen() {
    val viewModel = koinViewModel<HomeViewModel>()
    val uisState by viewModel.uiState.collectAsState()

    HomeContent(
        uiState = uisState,
    )
}

@Composable
fun HomeContent(uiState: HomeUiState) {
    ApplicationTopBar(
        navigationIcon = {
            IconButton(
                onClick = {},
                content = { Icon(Icons.Outlined.Info, null) },
            )
        },
        actions = {
            IconButton(
                onClick = {},
                content = { Icon(Icons.Outlined.Settings, null) },
            )
        },
    ) {
        val portfolioUiGateway = koinInject<PortfolioUiGateway>()

        when (uiState) {
            HomeUiState.Portfolios -> portfolioUiGateway.Portfolios()
        }
    }
}
