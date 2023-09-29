package pl.deniotokiari.capitalgaincalculator.feature.splash

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Shadow
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.sp
import pl.deniotokiari.capitalgaincalculator.R

@Composable
fun SplashScreen() {
    Box {
        Image(
            painter = painterResource(id = R.drawable.splash),
            contentScale = ContentScale.Crop,
            contentDescription = "splash"
        )

        Text(
            modifier = Modifier.align(Alignment.Center),
            text = stringResource(id = R.string.app_name),
            color = colorResource(id = R.color.white),
            style = TextStyle(
                fontSize = 32.sp,
                shadow = Shadow(
                    color = Color.Black,
                    offset = Offset(0.0F, 0.0F),
                    blurRadius = 25F
                )
            )
        )
    }
}