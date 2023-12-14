package pl.deniotokiari.core.ui.widget

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
import pl.deniotokiari.core.ui.R
import pl.deniotokiari.core.ui.theme.paddingMedium

sealed class AppHeaderWidgetAction {
    sealed class Left(open val action: () -> Unit) : AppHeaderWidgetAction() {
        data class Back(override val action: () -> Unit) : Left(action)
        data class About(override val action: () -> Unit) : Left(action)
    }
}

@Composable
fun AppHeaderWidget(
    title: String,
    leftAction: AppHeaderWidgetAction.Left,
    action: () -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = paddingMedium)
    ) {
        when (leftAction) {
            is AppHeaderWidgetAction.Left.About -> IconButton(onClick = leftAction.action) {
                Icon(
                    imageVector = Icons.Outlined.Info,
                    contentDescription = stringResource(id = R.string.about_button_description)
                )
            }

            is AppHeaderWidgetAction.Left.Back -> IconButton(onClick = leftAction.action) {
                Icon(
                    imageVector = Icons.AutoMirrored.Outlined.ArrowBack,
                    contentDescription = stringResource(id = R.string.back_button_description)
                )
            }
        }

        Text(
            text = title.ifEmpty { stringResource(id = R.string.app_name) },
            modifier = Modifier
                .align(Alignment.Center),
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
            onClick = action
        ) {
            Icon(
                imageVector = Icons.Outlined.Settings,
                contentDescription = stringResource(id = R.string.about_button_description)
            )
        }
    }
}