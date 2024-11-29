plugins {
    id("pl.deniotokiari.capital.gain.calculator.common")
}

kotlin {
    sourceSets {
        commonMain.dependencies {
            implementation(project(":core:misc"))
        }

        androidUnitTest.dependencies {
            implementation(libs.bundles.testing)
        }

        androidMain.dependencies {
            implementation(libs.kotlinx.coroutines.test)
        }
    }
}
