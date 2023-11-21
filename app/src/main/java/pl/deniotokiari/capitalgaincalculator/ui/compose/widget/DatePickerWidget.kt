@file:OptIn(ExperimentalMaterial3Api::class)

package pl.deniotokiari.capitalgaincalculator.ui.compose.widget

import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.PressInteraction
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.DatePicker
import androidx.compose.material3.DatePickerDialog
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.SelectableDates
import androidx.compose.material3.Text
import androidx.compose.material3.rememberDatePickerState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId
import java.time.format.DateTimeFormatter

private val dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")

@Composable
fun DatePickerWidget(
    onDateSelected: (LocalDate) -> Unit,
    initialDate: LocalDate? = null
) {
    var isExpanded by remember { mutableStateOf(false) }

    OutlinedTextField(
        value = initialDate?.let { dateTimeFormatter.format(it) } ?: "",
        onValueChange = {},
        readOnly = true,
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = 2.dp),
        placeholder = { Text(text = "Date") },
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
        val datePickerState = rememberDatePickerState(
            selectableDates = object : SelectableDates {
                override fun isSelectableDate(utcTimeMillis: Long): Boolean {
                    return utcTimeMillis <= System.currentTimeMillis()
                }
            },
            initialSelectedDateMillis = initialDate
                ?.atStartOfDay()
                ?.atZone(ZoneId.systemDefault())
                ?.toInstant()
                ?.toEpochMilli()
        )

        val selectedDate = datePickerState.selectedDateMillis?.let {
            convertMillisToDate(it)
        } ?: LocalDate.now()

        DatePickerDialog(
            onDismissRequest = { isExpanded = false },
            confirmButton = {
                Button(onClick = {
                    onDateSelected(selectedDate)
                    isExpanded = false
                }

                ) {
                    Text(text = stringResource(id = android.R.string.ok))
                }
            },
            dismissButton = {
                Button(onClick = {
                    isExpanded = false
                }) {
                    Text(text = stringResource(id = android.R.string.cancel))
                }
            }
        ) {
            DatePicker(
                state = datePickerState
            )
        }
    }
}

private fun convertMillisToDate(millis: Long): LocalDate =
    Instant.ofEpochMilli(millis).atZone(ZoneId.systemDefault()).toLocalDate()