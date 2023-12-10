package legacy.capitalgaincalculator.ui.compose.widget

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.outlined.ArrowBack
import androidx.compose.material.icons.outlined.Info
import androidx.compose.material.icons.outlined.Settings
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.sp
import org.koin.compose.koinInject
import pl.deniotokiari.capitalgaincalculator.R
import pl.deniotokiari.capitalgaincalculator.ui.navigation.AppHostNavigation
import pl.deniotokiari.capitalgaincalculator.ui.theme.paddingMedium

sealed class AppHeaderWidgetAction {
    sealed class Left : AppHeaderWidgetAction() {
        object Back : Left()
        object About : Left()
    }
}

@Composable
fun AppHeaderWidget(
    title: String,
    leftAction: AppHeaderWidgetAction.Left,
    appNavigation: AppHostNavigation = koinInject()
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = paddingMedium)
    ) {
        when (leftAction) {
            AppHeaderWidgetAction.Left.About -> IconButton(onClick = appNavigation::navigateToAbout) {
                Icon(
                    imageVector = Icons.Outlined.Info,
                    contentDescription = stringResource(id = R.string.about_button_description)
                )
            }

            AppHeaderWidgetAction.Left.Back -> IconButton(onClick = appNavigation::popBackStack) {
                Icon(
                    imageVector = Icons.AutoMirrored.Outlined.ArrowBack,
                    contentDescription = stringResource(id = R.string.back_button_description)
                )
            }
        }

        Text(
            text = title.ifEmpty { stringResource(id = R.string.app_name) },
            modifier = Modifier
                .align(Alignment.Center)
                .background(shimmerBrush(showShimmer = title.isEmpty())),
            style = TextStyle(
                fontSize = 18.sp,
                textAlign = TextAlign.Center
            ),
            color = if (title.isEmpty()) {
                Color.Transparent
            } else {
                Color.Unspecified
            }
        )

        IconButton(
            modifier = Modifier.align(Alignment.CenterEnd),
            onClick = appNavigation::navigateToSettings
        ) {
            Icon(
                imageVector = Icons.Outlined.Settings,
                contentDescription = stringResource(id = R.string.about_button_description)
            )
        }
    }
}