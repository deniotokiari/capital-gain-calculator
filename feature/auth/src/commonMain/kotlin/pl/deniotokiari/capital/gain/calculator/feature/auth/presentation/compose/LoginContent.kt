package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun LoginContent(
    onLogin: () -> Unit,
) {
    Column(
        modifier = Modifier.fillMaxSize(),
    ) {
        Button(
            onClick = onLogin,
        ) {
            Text(stringResource(Res.string.ui_kit_login))
        }
    }
}