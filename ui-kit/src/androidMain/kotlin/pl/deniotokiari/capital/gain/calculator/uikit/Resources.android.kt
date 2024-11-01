package pl.deniotokiari.capital.gain.calculator.uikit

import android.annotation.SuppressLint
import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalContext

@SuppressLint("DiscouragedApi")
@Composable
actual fun string(key: String): String {
    val id = LocalContext.current.resources.getIdentifier(
        key,
        "string",
        LocalContext.current.packageName,
    )

    return androidx.compose.ui.res.stringResource(id)
}
