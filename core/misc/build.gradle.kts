plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
    alias(libs.plugins.kotlin.serialization)
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.bundles.ktor.common)
            implementation(libs.kotlinx.serialization.json)
            implementation(libs.multiplatform.settings)
            implementation(libs.navigation.compose)

            implementation(project(":core:misc:platform:common"))
            api(project(":core:misc:platform:shared"))
        }

        androidMain.dependencies {
            implementation(libs.ktor.android)
        }

        iosMain.dependencies {
            implementation(libs.ktor.ios)
        }

        wasmJsMain.dependencies {
            implementation(libs.ktor.wasm)
        }
    }
}
