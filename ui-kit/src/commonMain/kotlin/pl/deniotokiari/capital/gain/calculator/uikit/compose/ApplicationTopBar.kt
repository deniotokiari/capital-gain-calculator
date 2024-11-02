package pl.deniotokiari.capital.gain.calculator.uikit.compose

import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.RowScope
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.Scaffold
import androidx.compose.material.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun ApplicationTopBar(
    title: @Composable () -> Unit = {},
    navigationIcon: @Composable (() -> Unit)? = null,
    actions: @Composable RowScope.() -> Unit = {},
    content: @Composable (PaddingValues) -> Unit,
) = Scaffold(
    topBar = {
        TopAppBar(
            elevation = 0.dp,
            title = title,
            backgroundColor = Color.Transparent,
            navigationIcon = navigationIcon,
            actions = actions,
        )
    },
    content = content,
)

@Composable
fun BackButton(onClick: () -> Unit) = IconButton(
    onClick = onClick,
    content = { Icon(Icons.AutoMirrored.Filled.ArrowBack, null) },
)
