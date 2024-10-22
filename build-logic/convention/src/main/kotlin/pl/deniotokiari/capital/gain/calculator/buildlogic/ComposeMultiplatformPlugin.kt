package pl.deniotokiari.capital.gain.calculator.buildlogic

import com.android.build.gradle.LibraryExtension
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.kotlin.dsl.configure
import org.gradle.kotlin.dsl.getByType
import org.jetbrains.compose.ComposeExtension
import org.jetbrains.kotlin.gradle.dsl.KotlinMultiplatformExtension

open class ComposeMultiplatformPlugin(
    private val pluginType: PluginType,
    private val projectTypes: List<ProjectType>,
) : Plugin<Project> {
    override fun apply(project: Project) = with(project) {
        with(pluginManager) {
            apply(libs.findPlugin("kotlinMultiplatform").get().get().pluginId)

            when (pluginType) {
                PluginType.Application -> {
                    apply(libs.findPlugin("androidApplication").get().get().pluginId)
                }
                PluginType.Library -> {
                    apply(libs.findPlugin("androidLibrary").get().get().pluginId)
                }
            }

            apply(libs.findPlugin("jetbrainsCompose").get().get().pluginId)
            apply(libs.findPlugin("compose-compiler").get().get().pluginId)

            //if (projectTypes.size != 1 || projectTypes.first() != ProjectType.Web) {
                apply("org.jetbrains.kotlinx.kover")
            //}
        }

        val compose = extensions.getByType<ComposeExtension>().dependencies

        extensions.configure<KotlinMultiplatformExtension> {
            sourceSets.apply {
                commonMain.dependencies {
                    implementation(compose.components.resources)
                    implementation(compose.components.uiToolingPreview)
                    implementation(compose.foundation)
                    implementation(compose.material)
                    implementation(compose.runtime)
                    implementation(compose.ui)
                }

                androidUnitTest.dependencies {
                    implementation(libs.findLibrary("kotlin-test").get().get())
                    implementation(libs.findLibrary("kotlinx-coroutines-test").get().get())
                    implementation(libs.findLibrary("mockito-kotlin").get().get())
                }
            }

            configureKotlinMultiplatform(
                types = projectTypes,
                extension = this,
            )
        }

        extensions.configure<LibraryExtension>(::configureKotlinAndroid)
    }
}

@Suppress("unused")
class CommonComposeMultiplatformPlugin : ComposeMultiplatformPlugin(
    pluginType = PluginType.Library,
    projectTypes = listOf(
        ProjectType.Android,
        ProjectType.Ios,
        ProjectType.Web,
    ),
)

@Suppress("unused")
class AndroidIosComposeMultiplatformPlugin : ComposeMultiplatformPlugin(
    pluginType = PluginType.Library,
    projectTypes = listOf(
        ProjectType.Android,
        ProjectType.Ios,
    ),
)

@Suppress("unused")
class WebComposeMultiplatformPlugin : ComposeMultiplatformPlugin(
    pluginType = PluginType.Library,
    projectTypes = listOf(
        ProjectType.Web,
    ),
)

sealed interface PluginType {
    object Library : PluginType
    object Application : PluginType
}