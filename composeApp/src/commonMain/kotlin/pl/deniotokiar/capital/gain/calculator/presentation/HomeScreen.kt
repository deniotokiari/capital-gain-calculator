package pl.deniotokiar.capital.gain.calculator.presentation

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import pl.deniotokiar.capital.gain.calculator.navigation.Greeting
import pl.deniotokiari.core.misc.compose.LocalNavController

@Composable
fun HomeScreen() {
    val navController = LocalNavController.current

    Box(modifier = Modifier.fillMaxSize()) {
        Text(text = "Home Screen")
        Button(
            onClick = {
                navController?.navigate(Greeting.name)
            },
            content = {
                Text(text = "To greeting screen")
            },
        )
    }
}