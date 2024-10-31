plugins {
    id("pl.deniotokiari.capital.gain.calculator.web")
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(libs.kotlinx.coroutines.core)

            implementation(project(":feature:auth:platform:shared"))
        }
    }
}
