package legacy.capitalgaincalculator.ui.compose.sheet

import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import legacy.capitalgaincalculator.ui.viewmodel.ImportCurrencyFromRevolutViewModel
import org.koin.androidx.compose.koinViewModel
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.ImportCurrencyFromRevolutViewModel

@Composable
fun ImportCurrencyFromRevolutSheet(
    id: String,
    viewModel: ImportCurrencyFromRevolutViewModel = koinViewModel(parameters = { parametersOf(id) })
) {
    val launcher = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocument()) {
        viewModel.onDocumentSelected(it)
    }

    Box(modifier = Modifier
        .padding(paddingLarge)
        .fillMaxWidth()) {
        val state by viewModel.uiState.collectAsState()

        when {
            state.loading -> CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
            else -> TextButton(
                onClick = { launcher.launch(arrayOf("text/*")) },
                modifier = Modifier.align(Alignment.Center)
            ) {
                Text(text = "Open file")
            }
        }
    }
}