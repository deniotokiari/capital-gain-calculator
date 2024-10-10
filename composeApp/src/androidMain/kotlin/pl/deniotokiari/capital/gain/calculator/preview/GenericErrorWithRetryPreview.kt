package pl.deniotokiari.capital.gain.calculator.preview

import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import pl.deniotokiari.capital.gain.calculator.uikit.compose.GenericErrorWithRetry

@Preview(showBackground = true)
@Composable
fun GenericErrorWithRetryPreview() = GenericErrorWithRetry(
    onRetry = {},
)