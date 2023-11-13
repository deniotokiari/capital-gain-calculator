package pl.deniotokiari.capitalgaincalculator.ui

import org.koin.androidx.viewmodel.dsl.viewModelOf
import org.koin.dsl.module
import pl.deniotokiari.capitalgaincalculator.ui.viewmodel.CurrencySelectorViewModel

val uiModule = module {
    viewModelOf(::CurrencySelectorViewModel)
}