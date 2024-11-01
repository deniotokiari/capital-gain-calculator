plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
    alias(libs.plugins.kotlin.serialization)
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.kotlinx.coroutines.core)
            implementation(libs.kotlinx.serialization.json)

            api(project(":core:misc:platform:shared"))
        }

        androidMain.dependencies {
            implementation(project(":core:misc:platform:android-ios"))
        }

        iosMain.dependencies {
            implementation(project(":core:misc:platform:android-ios"))
        }

        wasmJsMain.dependencies {
            implementation(project(":core:misc:platform:web"))
        }
    }
}
