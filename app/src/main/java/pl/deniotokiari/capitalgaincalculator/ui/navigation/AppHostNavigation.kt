package pl.deniotokiari.capitalgaincalculator.ui.navigation

import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.data.model.Position
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.HomeScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.InitProfileCurrencyScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.PortfolioScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.AddPortfolioSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.ImportFromRevolutSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.PositionAddSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.TickerSearchSheet

@Single(binds = [AppHostNavigation::class])
class AppHostNavigation : HostNavigation() {
    override val startDestination: Route = Destination.InitProfileCurrency.route
    override val destinations: List<Route> = Destination.values().map { it.route }

    fun navigateToHomeFromInitProfileCurrency() {
        navigate(Destination.Home.route, Destination.InitProfileCurrency.route, inclusive = true)
    }

    fun navigateToAbout() {
        navigate(Destination.About.route)
    }

    fun navigateToSettings() {
        navigate(Destination.Settings.route)
    }

    fun navigateToPortfolioAdd() {
        navigate(Destination.PortfolioAdd.route)
    }

    fun navigateToPortfolio(id: String) {
        navigateWithId(Destination.Portfolio.route, id)
    }

    suspend fun navigateToTickerSearch(ticker: String?): Ticker.Search? =
        navigateWithResult(Destination.TickerSearch.route, ticker)

    suspend fun navigateToPositionAdd(): Position? = navigateWithResult(Destination.PositionAdd.route, null)

    fun navigateToImportFromRevolute(id: String) = navigateWithId(Destination.ImportFromRevolut.route, id)

    enum class Destination(val route: Route) {
        Home(
            Route.composable(
                name = "home",
                content = { HomeScreen() }
            )
        ),
        About(
            Route.composable(
                name = "about",
                content = {}
            )
        ),
        Settings(
            Route.composable(
                name = "settings",
                content = {}
            )
        ),
        InitProfileCurrency(
            Route.composable(
                name = "init_profile_currency",
                content = { InitProfileCurrencyScreen() }
            )
        ),
        PortfolioAdd(
            Route.sheet(
                name = "portfolio_add",
                content = { AddPortfolioSheet() }
            )
        ),
        Portfolio(
            Route.composable(
                name = "portfolio/{${Route.ARGUMENT_ID}}",
                content = { PortfolioScreen(id = requireNotNull(it)) }
            )
        ),
        TickerSearch(
            Route.sheet(
                name = "ticker_search/{${Route.ARGUMENT_ID}}",
                content = { TickerSearchSheet(it) }
            )
        ),
        PositionAdd(
            Route.sheet(
                name = "position_add",
                content = { PositionAddSheet() }
            )
        ),
        ImportFromRevolut(
            Route.sheet(
                name = "import_from_revolut/{${Route.ARGUMENT_ID}}",
                content = { ImportFromRevolutSheet(id = requireNotNull(it)) }
            )
        )
    }
}