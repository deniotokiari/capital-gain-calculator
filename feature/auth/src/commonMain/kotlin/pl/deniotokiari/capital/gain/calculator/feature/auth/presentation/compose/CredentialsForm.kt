package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.material.Button
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_email
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_password
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.CredentialsField
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun CredentialsForm(
    buttonLabel: String,
    email: CredentialsField,
    password: CredentialsField,
    onEmailChange: (String) -> Unit,
    onPasswordChange: (String) -> Unit,
    onAction: () -> Unit,
) {
    Box(
        modifier = Modifier.wrapContentSize(),
        contentAlignment = Alignment.Center,
    ) {
        Column(
            modifier = Modifier.wrapContentSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
        ) {
            OutlinedTextField(
                enabled = email.enabled,
                isError = email.error,
                label = { Text(stringResource(Res.string.ui_kit_email)) },
                onValueChange = { onEmailChange(it) },
                value = email.value,
            )

            OutlinedTextField(
                enabled = password.enabled,
                isError = password.error,
                label = { Text(stringResource(Res.string.ui_kit_password)) },
                modifier = Modifier.padding(top = 4.dp),
                onValueChange = { onPasswordChange(it) },
                value = password.value,
                visualTransformation = PasswordVisualTransformation(),
            )

            Button(
                content = { Text(buttonLabel) },
                enabled = email.enabled && password.enabled,
                modifier = Modifier.padding(8.dp),
                onClick = onAction,
            )
        }

        if (!email.enabled || !password.enabled) {
            CircularProgressIndicator()
        }
    }
}