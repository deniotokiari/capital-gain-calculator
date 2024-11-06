plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
    alias(libs.plugins.kotlin.serialization)
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.androidx.lifecycle.viewmodel)
            implementation(libs.bundles.koin)
            implementation(libs.navigation.compose)
            implementation(project.dependencies.platform(libs.koin.bom))
            implementation(libs.kotlinx.serialization.json)
            implementation(compose.material3)

            implementation(project(":core:misc"))
            implementation(project(":gateway"))
            implementation(project(":ui-kit"))
            implementation(project(":core:navigation"))
        }
    }
}
