package pl.deniotokiari.capitalgaincalculator.ui.navigation

import org.koin.core.annotation.Single
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.model.Position
import pl.deniotokiari.capitalgaincalculator.data.model.Ticker
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.HomeScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.InitProfileCurrencyScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.screen.PortfolioScreen
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.AddPortfolioSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.CurrencySearchSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.ImportCurrencyFromRevolutSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.ImportTickerFromRevolutSheet
import pl.deniotokiari.capitalgaincalculator.ui.compose.sheet.ImportTickerFromTrading212Sheet
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

    fun navigateToImportTickerFromRevolut(id: String) = navigateWithId(Destination.ImportTickerFromRevolut.route, id)

    fun navigateToImportFromTrading212(id: String) = navigateWithId(Destination.ImportFromTrading212.route, id)

    suspend fun navigateToCurrencySearch(): Currency? = navigateWithResult(Destination.CurrencySearch.route, null)

    fun navigateToImportCurrencyFromRevolut(id: String) =
        navigateWithId(Destination.ImportCurrencyFromRevolut.route, id)

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
        ImportTickerFromRevolut(
            Route.sheet(
                name = "import_ticker_from_revolut/{${Route.ARGUMENT_ID}}",
                content = { ImportTickerFromRevolutSheet(id = requireNotNull(it)) }
            )
        ),
        ImportFromTrading212(
            Route.sheet(
                name = "import_from_trading212/{${Route.ARGUMENT_ID}}",
                content = { ImportTickerFromTrading212Sheet(id = requireNotNull(it)) }
            )
        ),
        CurrencySearch(
            Route.sheet(
                name = "currency_search/${Route.ARGUMENT_ID}",
                content = { CurrencySearchSheet() }
            )
        ),
        ImportCurrencyFromRevolut(
            Route.sheet(
                name = "import_currency_from_revolut/{${Route.ARGUMENT_ID}}",
                content = { ImportCurrencyFromRevolutSheet(id = requireNotNull(it)) }
            )
        )
    }
}