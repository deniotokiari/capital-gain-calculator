plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(project(":core:misc"))
        }

        androidMain.dependencies {
            implementation(libs.kotlinx.coroutines.test)
        }
    }
}