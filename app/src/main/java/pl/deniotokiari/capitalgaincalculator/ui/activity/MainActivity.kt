package pl.deniotokiari.capitalgaincalculator.ui.activity

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import org.koin.android.ext.android.get
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.domain.work.UpdateCurrenciesWorker
import pl.deniotokiari.capitalgaincalculator.ui.compose.CurrencySelector
import pl.deniotokiari.capitalgaincalculator.ui.theme.CapitalGainCalculatorTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        UpdateCurrenciesWorker.start(get())

        setContent {
            CapitalGainCalculatorTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Column {
                        var currency: Currency? by remember { mutableStateOf(null) }
                        CurrencySelector(selectedCurrency = currency, onCurrencySelected = {
                            currency = it
                        })
                    }
                }
            }
        }
    }
}
