package pl.deniotokiari.capital.gain.calculator.buildlogic

import com.android.build.gradle.LibraryExtension
import org.gradle.api.JavaVersion
import org.gradle.api.Project

private const val PACKAGE_NAME = "pl.deniotokiari.capital.gain.calculator"

internal fun Project.configureKotlinAndroid(extensions: LibraryExtension) = extensions.apply {
    val moduleName = path
        .removePrefix(":")
        .split(":")
        .joinToString(".")
        .replace("-", "")

    namespace = "$PACKAGE_NAME.$moduleName"

    compileSdk = libs.findVersion("android-compileSdk").get().requiredVersion.toInt()

    defaultConfig {
        minSdk = libs.findVersion("android-minSdk").get().requiredVersion.toInt()
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}