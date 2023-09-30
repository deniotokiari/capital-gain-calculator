package pl.deniotokiari.capitalgaincalculator.core.ui

import androidx.compose.material3.Button
import androidx.compose.material3.DatePicker
import androidx.compose.material3.DatePickerDialog
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.SelectableDates
import androidx.compose.material3.Text
import androidx.compose.material3.rememberDatePickerState
import androidx.compose.runtime.Composable
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AppDatePickerDialog(
    onDateSelected: (LocalDateTime) -> Unit,
    onDismiss: () -> Unit,
    initialDateTime: LocalDateTime? = null
) {
    val datePickerState = rememberDatePickerState(
        selectableDates = object : SelectableDates {
            override fun isSelectableDate(utcTimeMillis: Long): Boolean {
                return utcTimeMillis <= System.currentTimeMillis()
            }
        },
        initialSelectedDateMillis = initialDateTime?.atZone(ZoneId.systemDefault())?.toInstant()?.toEpochMilli()
    )

    val selectedDate = datePickerState.selectedDateMillis?.let {
        convertMillisToDate(it)
    } ?: LocalDateTime.now()

    DatePickerDialog(
        onDismissRequest = { onDismiss() },
        confirmButton = {
            Button(onClick = {
                onDateSelected(selectedDate)
                onDismiss()
            }

            ) {
                Text(text = "OK")
            }
        },
        dismissButton = {
            Button(onClick = {
                onDismiss()
            }) {
                Text(text = "Cancel")
            }
        }
    ) {
        DatePicker(
            state = datePickerState
        )
    }
}

private fun convertMillisToDate(millis: Long): LocalDateTime =
    Instant.ofEpochMilli(millis).atZone(ZoneId.systemDefault()).toLocalDateTime()