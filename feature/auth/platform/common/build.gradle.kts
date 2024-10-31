plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.kotlinx.coroutines.core)

            api(project(":feature:auth:platform:shared"))
        }

        androidMain.dependencies {
            implementation(project(":feature:auth:platform:android-ios"))
        }

        iosMain.dependencies {
            implementation(project(":feature:auth:platform:android-ios"))
        }

        wasmJsMain.dependencies {
            implementation(project(":feature:auth:platform:web"))
        }
    }
}
