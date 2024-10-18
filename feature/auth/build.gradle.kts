plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
}

kotlin {
    sourceSets {
        androidMain.dependencies {
            implementation(project(":platform:android-ios:auth"))
        }
        iosMain.dependencies {
            implementation(project(":platform:android-ios:auth"))
        }
        wasmJsMain.dependencies {
            implementation(project(":platform:web:auth"))
        }

        commonMain.dependencies {
            implementation(libs.androidx.lifecycle.viewmodel)
            implementation(libs.bundles.koin)
            implementation(libs.navigation.compose)
            implementation(project.dependencies.platform(libs.koin.bom))

            implementation(project(":core:misc"))
            implementation(project(":core:navigation"))
            implementation(project(":platform:common:auth"))
            implementation(project(":ui-kit"))
        }
    }
}