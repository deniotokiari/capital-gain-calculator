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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.LinkAnnotation
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.withLink
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import capital_gain_calculator.ui_kit.generated.resources.Res
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_email
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_generic_error_title
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_login
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_password
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_signup
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_signup_message
import capital_gain_calculator.ui_kit.generated.resources.ui_kit_signup_title
import pl.deniotokiari.capital.gain.calculator.uikit.stringResource

@Composable
fun SignupContent() {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = CenterHorizontally,
        verticalArrangement = Center,
    )
    {
        Text(
            text = stringResource(Res.string.ui_kit_signup_title),
            style = MaterialTheme.typography.h6,
            modifier = Modifier.padding(8.dp)
        )

        Text(
            style = MaterialTheme.typography.body2,
            modifier = Modifier.padding(8.dp),
            text = buildAnnotatedString {
                append(stringResource(Res.string.ui_kit_signup_message))
                append(" ")

                withLink(
                    link = LinkAnnotation.Clickable(
                        tag = "LOGIN",
                        linkInteractionListener = {

                        },
                    ),
                ) {
                    withStyle(SpanStyle(color = MaterialTheme.colors.primary)) {
                        append(stringResource(Res.string.ui_kit_login))
                    }
                }
            },
        )

        OutlinedTextField(
            value = "",
            onValueChange = {},
            label = { Text(stringResource(Res.string.ui_kit_email)) },
        )

        OutlinedTextField(
            value = "",
            onValueChange = {},
            label = { Text(stringResource(Res.string.ui_kit_password)) },
        )

        Button(
            modifier = Modifier.padding(8.dp),
            onClick = {},
            content = { Text(stringResource(Res.string.ui_kit_signup)) }
        )
    }
}