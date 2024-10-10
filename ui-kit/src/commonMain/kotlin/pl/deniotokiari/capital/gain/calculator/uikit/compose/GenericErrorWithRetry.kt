package pl.deniotokiari.capital.gain.calculator.uikit.compose

import androidx.compose.foundation.layout.Arrangement.Center
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment.Companion.CenterHorizontally
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_generic_error_message
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_generic_error_title
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_retry
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun GenericErrorWithRetry(
    onRetry: () -> Unit,
) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = CenterHorizontally,
        verticalArrangement = Center,
    ) {
        Text(
            text = stringResource(Res.string.ui_kit_generic_error_title),
            style = MaterialTheme.typography.h6,
            modifier = Modifier.padding(8.dp)
        )

        Text(
            text = stringResource(Res.string.ui_kit_generic_error_message),
            style = MaterialTheme.typography.body2,
            modifier = Modifier.padding(8.dp)
        )

        Button(
            onClick = onRetry,
        ) {
            Text(
                text = stringResource(Res.string.ui_kit_retry),
            )
        }
    }
}