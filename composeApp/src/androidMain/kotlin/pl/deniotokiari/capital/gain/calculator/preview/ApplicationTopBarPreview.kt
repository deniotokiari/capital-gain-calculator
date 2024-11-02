package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ExitToApp
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.Add
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.uikit.compose.ApplicationTopBar
import pl.deniotokiari.capital.gain.calculator.uikit.compose.BackButton

@Preview(showBackground = true)
@Composable
fun ApplicationTopBarPreview() = ApplicationTopBar(
    navigationIcon = { BackButton {} },
    actions = {
        IconButton(
            onClick = { },
            content = { Icon(Icons.AutoMirrored.Filled.ExitToApp, null) },
        )

        IconButton(
            onClick = { },
            content = { Icon(Icons.AutoMirrored.Filled.List, null) },
        )

        IconButton(
            onClick = { },
            content = { Icon(Icons.Filled.Add, null) },
        )
    },
    title = { Text(text = "Title") },
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center,
    ) {
        Text("Preview")
    }
}
