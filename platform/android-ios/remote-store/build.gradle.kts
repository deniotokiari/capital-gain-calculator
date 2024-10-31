plugins {
    id("pl.deniotokiari.capital.gain.calculator.androidios")
    alias(libs.plugins.kotlin.serialization)
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.kotlinx.coroutines.core)
            implementation(libs.firebase.firestore)

            implementation(project(":platform:common:remote-store"))
        }
    }
}
