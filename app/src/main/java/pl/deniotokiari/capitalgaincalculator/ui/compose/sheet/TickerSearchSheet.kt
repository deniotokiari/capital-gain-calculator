package pl.deniotokiari.capitalgaincalculator.ui.compose.sheet

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import org.koin.androidx.compose.koinViewModel
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingSmall
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingXLarge
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.TickerSearchViewModel

@Composable
fun TickerSearchSheet(
    viewModel: TickerSearchViewModel = koinViewModel()
) {
    Column(
        modifier = Modifier.padding(paddingLarge)
    ) {
        var ticker by remember { mutableStateOf("") }

        OutlinedTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = paddingSmall),
            value = ticker,
            onValueChange = {
                ticker = it

                viewModel.onQueryChanged(it)
            },
            placeholder = { Text(text = stringResource(id = R.string.ticker)) },
            maxLines = 1
        )

        val state by viewModel.uiState.collectAsState()

        when {
            state.loading -> CircularProgressIndicator(
                modifier = Modifier
                    .padding(paddingLarge)
                    .align(Alignment.CenterHorizontally)
            )

            state.noResult -> Text(
                text = stringResource(id = R.string.no_result),
                modifier = Modifier
                    .padding(paddingXLarge)
                    .align(Alignment.CenterHorizontally)
            )

            else -> {
                LazyColumn {
                    state.items.forEachIndexed { index, item ->
                        item(item.title) {
                            Box(
                                modifier = Modifier
                                    .clickable { viewModel.onSearchResultClicked(index) }
                                    .fillMaxWidth()
                            ) {
                                Text(
                                    text = item.title,
                                    modifier = Modifier
                                        .padding(paddingSmall)
                                        .padding(vertical = paddingMedium)
                                        .fillMaxWidth()
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}