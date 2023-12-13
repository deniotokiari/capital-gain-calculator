package pl.deniotokiari.feature.init_profile.presentation

import android.R
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.core.ui.theme.paddingLarge
import pl.deniotokiari.core.ui.theme.paddingMedium
import pl.deniotokiari.core.ui.theme.paddingXXLarge
import pl.deniotokiari.core.ui.widget.ItemSelectorWidget
import pl.deniotokiari.feature.init_profile.viewmodel.InitProfileViewModel

@Composable
fun InitProfileScreen(
    viewModel: InitProfileViewModel = koinViewModel()
) {
    Box(modifier = Modifier.fillMaxSize()) {
        val uiState by viewModel.uiState.collectAsState()

        when {
            uiState.loading -> CircularProgressIndicator()
            else -> {
                Column(
                    modifier = Modifier
                        .padding(paddingLarge)
                        .padding(bottom = paddingXXLarge)
                        .align(Alignment.Center)
                ) {
                    Text(
                        text = "In order to use application you should select profile currency firstly",
                        modifier = Modifier.padding(paddingMedium)
                    )

                    ItemSelectorWidget(
                        title = uiState.title,
                        label = uiState.label,
                        items = uiState.currencies,
                        selected = uiState.selected,
                        onSelected = viewModel::onCurrencySelected
                    )

                    TextButton(
                        enabled = uiState.confirmEnabled,
                        onClick = { viewModel.onConfirmClicked() },
                        modifier = Modifier
                            .padding(paddingMedium)
                            .align(Alignment.End)
                    ) {
                        Text(text = stringResource(id = R.string.ok))
                    }
                }
            }
        }
    }
}