package pl.deniotokiari.capital.gain.calculator.presentation

sealed interface AppUiAction {
    data object AuthRequired : AppUiAction
    data object NavigateToHome : AppUiAction
}
