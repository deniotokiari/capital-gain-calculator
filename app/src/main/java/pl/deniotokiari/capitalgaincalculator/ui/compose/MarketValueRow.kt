package pl.deniotokiari.capitalgaincalculator.ui.compose

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxScope
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.sp
import androidx.core.graphics.toColorInt
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingSmall
import java.math.BigDecimal
import java.text.DecimalFormat

@Composable
fun MarketValueRow(
    marketData: MarketData,
    content: @Composable BoxScope.() -> Unit
) {
    val currencyFormat = DecimalFormat("#,###.00")
    val percentFormat = DecimalFormat("##.00")
    val fontSize = 14.sp
    val green = Color("#027560".toColorInt())
    val red = Color("#BC1513".toColorInt())

    Row(
        modifier = Modifier
            .padding(vertical = paddingMedium + paddingSmall)
            .fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Box(modifier = Modifier.weight(0.2F)) {
            content(this)
        }

        // market value
        Text(
            text = "${currencyFormat.format(marketData.marketValue.value)}${marketData.marketValue.currency.code.value}",
            modifier = Modifier.weight(0.3F),
            fontSize = fontSize,
            textAlign = TextAlign.End
        )

        // gain
        Text(
            text = "${currencyFormat.format(marketData.gain.value)}${marketData.gain.currency.code.value}",
            modifier = Modifier.weight(0.3F),
            fontSize = fontSize,
            textAlign = TextAlign.End,
            color = if (marketData.gain.value < BigDecimal.ZERO) {
                red
            } else {
                green
            }
        )

        // percent
        Text(
            text = "${percentFormat.format(marketData.percent.value)}%",
            modifier = Modifier.weight(0.2F),
            fontSize = fontSize,
            textAlign = TextAlign.End,
            color = if (marketData.percent.value < BigDecimal.ZERO) {
                red
            } else {
                green
            }
        )
    }
}