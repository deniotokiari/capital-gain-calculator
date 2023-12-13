package pl.deniotokiari.core.ui.widget

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import pl.deniotokiari.core.ui.theme.Purple40

@Composable
fun ItemsWithSearchWidget(
    selected: Int? = null,
    items: List<String>,
    label: String,
    onSelected: (Int) -> Unit
) {
    var searchInput by remember { mutableStateOf("") }
    val itemsWithIndex = items.mapIndexed { index, item -> index to item }

    OutlinedTextField(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        value = searchInput,
        onValueChange = { searchInput = it },
        label = { Text(text = label) },
        singleLine = true
    )
    LazyColumn {
        itemsWithIndex
            .filter { (_, item) ->
                if (searchInput.isEmpty()) {
                    true
                } else {
                    item.lowercase().contains(searchInput.lowercase())
                }
            }
            .forEach { (index, item) ->
                item(key = item) {
                    Text(
                        text = item,
                        modifier = Modifier
                            .clickable { onSelected(index) }
                            .fillParentMaxWidth()
                            .padding(16.dp),
                        color = if (index == selected) {
                            Purple40
                        } else {
                            Color.Unspecified
                        }
                    )
                }
            }
    }
}