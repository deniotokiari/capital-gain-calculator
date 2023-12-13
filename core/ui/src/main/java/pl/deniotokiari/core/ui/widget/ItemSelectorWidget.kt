@file:OptIn(ExperimentalMaterial3Api::class)

package pl.deniotokiari.core.ui.widget

import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.PressInteraction
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun ItemSelectorWidget(
    selected: Int? = null,
    title: String,
    label: String,
    items: List<String>,
    onSelected: (Int) -> Unit
) {
    var isExpanded by remember { mutableStateOf(false) }

    OutlinedTextField(
        value = "",
        onValueChange = {},
        readOnly = true,
        trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = isExpanded) },
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = 2.dp),
        placeholder = { Text(text = title) },
        interactionSource = remember { MutableInteractionSource() }.also { interactionSource ->
            LaunchedEffect(interactionSource) {
                interactionSource.interactions.collect {
                    if (it is PressInteraction.Release) {
                        isExpanded = !isExpanded
                    }
                }
            }
        }
    )

    if (isExpanded) {
        ModalBottomSheet(
            onDismissRequest = { isExpanded = false }
        ) {
            ItemsWithSearchWidget(
                selected = selected,
                items = items,
                label = label,
                onSelected = { index ->
                    isExpanded = false

                    onSelected(index)
                }
            )
        }
    }
}