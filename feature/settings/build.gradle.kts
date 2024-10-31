plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.androidx.lifecycle.viewmodel)
            implementation(libs.bundles.koin)
            implementation(libs.navigation.compose)
            implementation(project.dependencies.platform(libs.koin.bom))

            implementation(project(":core:misc"))
            implementation(project(":core:navigation"))
            implementation(project(":ui-kit"))
        }
    }
}
