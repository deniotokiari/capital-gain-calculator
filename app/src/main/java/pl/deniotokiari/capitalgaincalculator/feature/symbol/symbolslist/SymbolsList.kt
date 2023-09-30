package pl.deniotokiari.capitalgaincalculator.feature.symbol.symbolslist

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import org.koin.androidx.compose.koinViewModel
import org.koin.core.parameter.parametersOf
import pl.deniotokiari.capitalgaincalculator.feature.position.PositionCreator
import pl.deniotokiari.capitalgaincalculator.ui.theme.Purple40

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SymbolsList(
    portfolioId: String,
    modifier: Modifier = Modifier,
    viewModel: SymbolsListViewModel = koinViewModel(parameters = { parametersOf(portfolioId) })
) {
    val uiState by viewModel.uiState.collectAsState()
    val symbols = uiState.symbols

    if (symbols.isNotEmpty()) {
        LazyColumn(
            modifier = modifier.fillMaxWidth()
        ) {
            symbols.forEach { symbol ->
                item {
                    var expanded by rememberSaveable(key = symbol.symbol) { mutableStateOf(false) }

                    Row(
                        modifier = Modifier
                            .fillParentMaxWidth()
                            .padding(vertical = 2.dp)
                            .clickable { expanded = !expanded },
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Row {
                            Text(text = symbol.symbol)
                        }

                        ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded)
                    }

                    if (expanded) {
                        var addPosition by remember { mutableStateOf(false) }

                        Column(
                            modifier = Modifier.fillParentMaxWidth(),
                        ) {
                            Text(
                                text = "+ Add Position",
                                modifier = Modifier
                                    .clickable {
                                        addPosition = true
                                    }
                                    .align(Alignment.CenterHorizontally),
                                color = Purple40,
                            )
                        }

                        if (addPosition) {
                            PositionCreator(
                                onDismiss = { addPosition = false },
                                onPosition = {
                                    viewModel.addPosition(
                                        symbol = symbol,
                                        position = it
                                    )
                                    addPosition = false
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}