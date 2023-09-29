package pl.deniotokiari.capitalgaincalculator.feature.initialization

import org.koin.androidx.viewmodel.dsl.viewModelOf
import org.koin.dsl.module

val initializeModule = module {
    viewModelOf(::InitializationViewModel)
}