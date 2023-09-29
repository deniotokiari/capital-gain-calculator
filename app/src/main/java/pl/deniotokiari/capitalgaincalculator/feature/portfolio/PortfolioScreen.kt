package pl.deniotokiari.capitalgaincalculator.feature.portfolio

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import pl.deniotokiari.capitalgaincalculator.feature.main.LocalNavController
import pl.deniotokiari.capitalgaincalculator.feature.symbol.SymbolSearch
import pl.deniotokiari.capitalgaincalculator.feature.symbol.symbolslist.SymbolsList
import pl.deniotokiari.capitalgaincalculator.ui.theme.Purple40

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PortfolioScreen(viewModel: PortfolioViewModel) {
    Column {
        val navController = LocalNavController.current
        val uiState by viewModel.uiState.collectAsState()

        Box(
            modifier = Modifier.fillMaxWidth()
        ) {
            IconButton(onClick = { navController.popBackStack() }) {
                Icon(imageVector = Icons.Filled.ArrowBack, contentDescription = "back")
            }
            Text(
                modifier = Modifier.align(Alignment.Center),
                text = "Portfolio ${uiState.portfolioName}"
            )
        }

        var addSymbol by remember { mutableStateOf(false) }

        Text(
            text = "+ Add Symbol",
            modifier = Modifier
                .clickable { addSymbol = true }
                .align(Alignment.CenterHorizontally),
            color = Purple40,
        )

        SymbolsList(
            portfolioId = viewModel.portfolioId,
            modifier = Modifier.padding(16.dp)
        )

        if (addSymbol) {
            SymbolSearch(
                onSymbol = {
                    viewModel.addSymbol(it)
                    addSymbol = false
                },
                onDismiss = {
                    addSymbol = false
                }
            )
        }
    }
}