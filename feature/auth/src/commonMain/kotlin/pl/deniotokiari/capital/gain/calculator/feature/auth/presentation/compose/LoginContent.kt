package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose

import androidx.compose.foundation.layout.Arrangement.Center
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment.Companion.CenterHorizontally
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_email
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login_message
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login_title
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_password
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiAction
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun LoginContent(
    onAction: (AuthUiAction) -> Unit,
) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = CenterHorizontally,
        verticalArrangement = Center,
    ) {
        Text(
            text = stringResource(Res.string.ui_kit_login_title),
            style = MaterialTheme.typography.h6,
            modifier = Modifier.padding(8.dp)
        )

        Text(
            text = stringResource(Res.string.ui_kit_login_message),
            style = MaterialTheme.typography.body2,
            modifier = Modifier.padding(8.dp)
        )

        OutlinedTextField(
            value = "",
            onValueChange = {},
            label = { Text(stringResource(Res.string.ui_kit_email)) },
        )

        OutlinedTextField(
            modifier = Modifier.padding(top = 4.dp),
            value = "",
            onValueChange = {},
            label = { Text(stringResource(Res.string.ui_kit_password)) },
        )

        Button(
            modifier = Modifier.padding(8.dp),
            onClick = { onAction(AuthUiAction.Login) },
        ) {
            Text(stringResource(Res.string.ui_kit_login))
        }
    }
}