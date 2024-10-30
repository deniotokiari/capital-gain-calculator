package pl.deniotokiari.capital.gain.calculator

import androidx.compose.runtime.Composable
import org.koin.compose.KoinApplication
import pl.deniotokiari.capital.gain.calculator.di.previewModule

@Composable
fun PreviewApplication(content: @Composable () -> Unit) = KoinApplication(
    application = { modules(previewModule) },
) {
    content()
}