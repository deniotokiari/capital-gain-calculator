package pl.deniotokiari.capital.gain.calculator.uikit

import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalInspectionMode
import org.jetbrains.compose.resources.StringResource
import org.jetbrains.compose.resources.stringResource

@Composable
expect fun string(key: String): String

@Composable
fun stringResource(resource: StringResource): String {
    return if (LocalInspectionMode.current) {
        string(resource.key)
    } else {
        stringResource(resource)
    }
}
