package pl.deniotokiari.core.common

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

fun ViewModel.launchInDefault(block: suspend CoroutineScope.() -> Unit) {
    viewModelScope.launch(Dispatchers.Default, block = block)
}