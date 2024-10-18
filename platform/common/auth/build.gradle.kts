plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.kotlinx.coroutines.core)
        }
    }
}
