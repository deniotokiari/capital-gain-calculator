package pl.deniotokiari.capitalgaincalculator.feature.position

import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.PressInteraction
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.core.ui.AppDatePickerDialog
import pl.deniotokiari.capitalgaincalculator.currency.Currency
import pl.deniotokiari.capitalgaincalculator.currency.CurrencySelector
import pl.deniotokiari.capitalgaincalculator.currency.CurrencyValue
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PositionCreator(onDismiss: () -> Unit, onPosition: (Position) -> Unit) {
    val dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")

    ModalBottomSheet(onDismissRequest = onDismiss) {
        var count: Double? by remember { mutableStateOf(null) }
        var price: Double? by remember { mutableStateOf(null) }
        var currency: Currency? by remember { mutableStateOf(null) }
        var date: LocalDateTime? by remember { mutableStateOf(LocalDateTime.now()) }

        var showDatePicker by remember { mutableStateOf(false) }

        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            OutlinedTextField(
                value = count?.toString() ?: "",
                onValueChange = {
                    count = it.toDoubleOrNull()
                },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Decimal),
                modifier = Modifier.fillMaxWidth(),
                label = { Text(text = "Count") }
            )
            OutlinedTextField(
                value = price?.toString() ?: "",
                onValueChange = {
                    price = it.toDoubleOrNull()
                },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Decimal),
                modifier = Modifier.fillMaxWidth(),
                label = { Text(text = "Price") }
            )
            CurrencySelector(onSelected = { currency = it })
            TextField(
                value = dateTimeFormatter.format(date),
                onValueChange = {},
                readOnly = true,
                colors = ExposedDropdownMenuDefaults.textFieldColors(),
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 2.dp),
                placeholder = { Text(text = "Date") },
                interactionSource = remember { MutableInteractionSource() }.also { interactionSource ->
                    LaunchedEffect(interactionSource) {
                        interactionSource.interactions.collect {
                            if (it is PressInteraction.Release) {
                                showDatePicker = !showDatePicker
                            }
                        }
                    }
                },
            )
            Button(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 4.dp, bottom = 16.dp),
                onClick = {
                    onPosition(
                        Position(
                            date = date!!,
                            count = count!!,
                            price = CurrencyValue(value = price!!, currency = currency!!)
                        )
                    )
                    onDismiss()
                },
                enabled = count != null && price != null && currency != null && date != null
            ) {
                Text(text = stringResource(id = R.string.done))
            }
        }

        if (showDatePicker) {
            AppDatePickerDialog(
                onDateSelected = {
                    date = it
                },
                onDismiss = { showDatePicker = false },
                initialDateTime = date
            )
        }
    }
}