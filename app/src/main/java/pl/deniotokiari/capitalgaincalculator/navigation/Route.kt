package pl.deniotokiari.capitalgaincalculator.navigation

sealed class Route(val route: String) {
    object Loading : Route("loading")
    object Home : Route("home")
    object Initialize : Route("initialize")
    object Portfolio : Route("portfolio/{id}") {
        fun makeRoute(id: String) = "portfolio/$id"
    }
}