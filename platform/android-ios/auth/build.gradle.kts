plugins {
    id("pl.deniotokiari.capital.gain.calculator.androidios")
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.firebase.auth)
            implementation(libs.kotlinx.coroutines.core)

            implementation(project(":platform:common:auth"))
        }
    }
}
