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
        }

        androidMain.dependencies {
            implementation(libs.ktor.android)

            implementation(project(":platform:android-ios:remote-store"))
        }

        iosMain.dependencies {
            implementation(libs.ktor.ios)

            implementation(project(":platform:android-ios:remote-store"))
        }

        wasmJsMain.dependencies {
            implementation(libs.ktor.wasm)

            implementation(project(":platform:web:remote-store"))
        }
    }
}
