package pl.deniotokiari.capitalgaincalculator.feature.symbol

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import org.koin.compose.getKoin

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SymbolSearch(onSymbol: (Symbol) -> Unit, onDismiss: () -> Unit) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        val useCase = getKoin().get<SymbolSearchByQueryUseCase>()
        var searchInput by rememberSaveable { mutableStateOf("") }
        var list: List<Symbol> by rememberSaveable { mutableStateOf(emptyList()) }

        OutlinedTextField(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            value = searchInput,
            onValueChange = {
                searchInput = it
            },
            label = { Text(text = "Search for symbol") },
            singleLine = true
        )

        if (searchInput.isNotEmpty()) {
            if (list.isEmpty()) {
                CircularProgressIndicator(
                    modifier = Modifier.align(Alignment.CenterHorizontally)
                )
            } else {
                LazyColumn {
                    list.forEach {
                        item {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp)
                                    .clickable {
                                        onSymbol(it)
                                        onDismiss()
                                    }
                            ) {
                                Text(
                                    modifier = Modifier.fillMaxWidth(),
                                    text = it.toSearchResultString(),
                                    maxLines = 1
                                )
                            }
                        }
                    }
                }
            }
        }

        LaunchedEffect(searchInput) {
            if (searchInput.isBlank()) {
                return@LaunchedEffect
            }

            delay(500L)
            list = withContext(Dispatchers.IO) { useCase(searchInput) }
        }
    }
}