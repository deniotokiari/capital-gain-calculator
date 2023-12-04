package pl.deniotokiari.capitalgaincalculator.ui.compose.widget

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
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.sp
import androidx.core.graphics.toColorInt
import pl.deniotokiari.capitalgaincalculator.domain.model.MarketData
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingLarge
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingSmall
import java.math.BigDecimal
import java.text.DecimalFormat

@Composable
fun MarketValueWidget(
    modifier: Modifier = Modifier,
    marketData: MarketData?,
    fontSize: TextUnit = 14.sp,
    content: (@Composable BoxScope.() -> Unit)? = null
) {
    val currencyFormat = DecimalFormat("#,##0.00")
    val percentFormat = DecimalFormat("#0.00")
    val green = Color("#027560".toColorInt())
    val red = Color("#BC1513".toColorInt())

    Row(
        modifier = modifier
            .padding(vertical = paddingMedium + paddingSmall, horizontal = paddingLarge)
            .fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        if (marketData?.isCash == true) {
            Text(
                text = "${currencyFormat.format(marketData.marketValue.value)}${marketData.marketValue.currency.code.value}",
                modifier = Modifier.fillMaxWidth(),
                fontSize = fontSize,
                textAlign = TextAlign.Start
            )

            return
        }

        val contentWeight = 0.25F
        var marketWeight = 0.29F
        var gainWeight = 0.28F
        var percentWeight = 0.18F

        var textAlign = TextAlign.End

        if (content == null) {
            (1F / 3).let {
                marketWeight = it
                gainWeight = it
                percentWeight = it
            }

            textAlign = TextAlign.Center
        }

        content?.let {
            Box(modifier = Modifier.weight(contentWeight)) {
                it(this)
            }
        }

        marketData ?: return

        // market value
        Text(
            text = "${currencyFormat.format(marketData.marketValue.value)}${marketData.marketValue.currency.code.value}",
            modifier = Modifier.weight(marketWeight),
            fontSize = fontSize,
            textAlign = textAlign
        )

        val gainSign = if (marketData.gain.value < BigDecimal.ZERO) {
            ""
        } else {
            "+"
        }

        // gain
        Text(
            text = "$gainSign${currencyFormat.format(marketData.gain.value)}${marketData.gain.currency.code.value}",
            modifier = Modifier.weight(gainWeight),
            fontSize = fontSize,
            textAlign = textAlign,
            color = if (marketData.gain.value < BigDecimal.ZERO) {
                red
            } else {
                green
            }
        )

        val percentSign = if (marketData.percent.value < BigDecimal.ZERO) {
            ""
        } else {
            "+"
        }

        // percent
        Text(
            text = "$percentSign${percentFormat.format(marketData.percent.value)}%",
            modifier = Modifier.weight(percentWeight),
            fontSize = fontSize,
            textAlign = textAlign,
            color = if (marketData.percent.value < BigDecimal.ZERO) {
                red
            } else {
                green
            }
        )
    }
}