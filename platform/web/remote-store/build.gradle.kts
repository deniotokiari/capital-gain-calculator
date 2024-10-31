plugins {
    id("pl.deniotokiari.capital.gain.calculator.web")
    alias(libs.plugins.kotlin.serialization)
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.kotlinx.coroutines.core)
            implementation(libs.kotlinx.serialization.json)

            implementation(project(":platform:common:remote-store"))
        }
    }
}
