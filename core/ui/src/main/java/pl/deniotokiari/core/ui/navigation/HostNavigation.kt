@file:OptIn(ExperimentalMaterialNavigationApi::class, ExperimentalMaterial3Api::class)

package pl.deniotokiari.core.ui.navigation

import androidx.compose.foundation.layout.ColumnScope
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.runtime.Composable
import androidx.navigation.NamedNavArgument
import androidx.navigation.NavBackStackEntry
import androidx.navigation.NavController
import androidx.navigation.NavDeepLink
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavHostController
import androidx.navigation.compose.composable
import com.google.accompanist.navigation.material.ExperimentalMaterialNavigationApi
import com.google.accompanist.navigation.material.bottomSheet
import kotlinx.coroutines.suspendCancellableCoroutine
import pl.deniotokiari.core.ui.navigation.HostNavigation.Route.Companion.getId
import kotlin.coroutines.resume

abstract class HostNavigation {
    lateinit var controller: NavHostController
    abstract val startDestination: Route
    abstract val destinations: List<Route>

    fun navigationGraph(builder: NavGraphBuilder) {
        with(builder) {
            destinations.forEach { destination ->
                when (destination.type) {
                    Route.Type.COMPOSABLE -> composable(destination.name) {
                        destination.content(it.getId())
                    }

                    Route.Type.SHEET -> sheet(destination.name) {
                        destination.content(it.getId())
                    }
                }
            }
        }
    }

    fun navigate(route: String) {
        controller.navigate(route)
    }

    fun navigate(route: String, popTo: String, inclusive: Boolean) {
        controller.navigate(route) {
            popUpTo(popTo) {
                this.inclusive = inclusive
            }
        }
    }

    fun navigateWithId(route: String, id: String) {
        controller.navigate(route.addId(id))
    }

    fun popBackStack() {
        controller.popBackStack()
    }

    fun <T> popBackStack(value: T) {
        controller.previousBackStackEntry?.savedStateHandle?.set(Route.KEY_VALUE, value)
        controller.popBackStack()
    }

    protected suspend fun <T> navigateWithResult(route: String, id: String?): T? {
        val backstackEntry = controller.currentBackStackEntry
        controller.navigate(route.addId(id))

        val result = suspendCancellableCoroutine {
            lateinit var onDestinationChangedListener: NavController.OnDestinationChangedListener

            onDestinationChangedListener =
                NavController.OnDestinationChangedListener { controller, destination, _ ->
                    if (backstackEntry?.destination?.route == destination.route) {
                        controller.removeOnDestinationChangedListener(onDestinationChangedListener)

                        val value = backstackEntry?.savedStateHandle?.get<T>(Route.KEY_VALUE)
                        backstackEntry?.savedStateHandle?.remove<T>(Route.KEY_VALUE)

                        it.resume(value)
                    }
                }

            controller.addOnDestinationChangedListener(onDestinationChangedListener)
        }

        return result
    }

    private fun NavGraphBuilder.sheet(
        route: String,
        arguments: List<NamedNavArgument> = emptyList(),
        deepLinks: List<NavDeepLink> = emptyList(),
        content: @Composable ColumnScope.(backstackEntry: NavBackStackEntry) -> Unit
    ) {
        bottomSheet(route, arguments, deepLinks) {
            ModalBottomSheet(onDismissRequest = {
                controller.popBackStack()
            }) {
                content(this, it)
            }
        }
    }

    data class Route(
        val name: String,
        val type: Type,
        val content: @Composable (String?) -> Unit
    ) {
        enum class Type {
            COMPOSABLE, SHEET
        }

        companion object {
            internal const val ARGUMENT_ID = "id"
            internal const val KEY_VALUE = "value"

            internal fun NavBackStackEntry.getId(): String? {
                val id = arguments?.getString(ARGUMENT_ID)

                return if (id == "{$ARGUMENT_ID}") {
                    null
                } else {
                    id
                }
            }

            fun composable(name: String, content: @Composable (id: String?) -> Unit): Route = Route(
                name = name,
                content = content,
                type = Type.COMPOSABLE
            )

            fun sheet(name: String, content: @Composable (id: String?) -> Unit): Route = Route(
                name = name,
                content = content,
                type = Type.SHEET
            )
        }
    }
}

fun String.withId(): String = "$this/{${HostNavigation.Route.ARGUMENT_ID}}"

private fun String.addId(id: String?): String = if (id != null) {
    replace("{${HostNavigation.Route.ARGUMENT_ID}}", id)
} else {
    this
}