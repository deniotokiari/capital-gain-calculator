package pl.deniotokiari.capital.gain.calculator.feature.portfolio.gateway

import androidx.compose.runtime.Composable
import pl.deniotokiari.capital.gain.calculator.feature.portfolio.presentation.compose.PortfoliosList
import pl.deniotokiari.capital.gain.calculator.gateway.feature.portfolio.PortfolioUiGateway

class PortfolioFeatureUiGateway : PortfolioUiGateway {
    @Composable
    override fun Portfolios() = PortfoliosList()
}
