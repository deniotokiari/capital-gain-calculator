package pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.compose

import androidx.compose.foundation.layout.Arrangement.Center
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment.Companion.CenterHorizontally
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login_message
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login_title
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.AuthUiAction
import pl.deniotokiari.capital.gain.calculator.feature.auth.presentation.CredentialsField
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun LoginContent(
    email: CredentialsField,
    password: CredentialsField,
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

        CredentialsForm(
            buttonLabel = stringResource(Res.string.ui_kit_login),
            email = email,
            password = password,
            onEmailChange = { onAction(AuthUiAction.EmailChanged(it)) },
            onPasswordChange = { onAction(AuthUiAction.PasswordChanged(it)) },
            onAction = { onAction(AuthUiAction.Login) },
        )
    }
}