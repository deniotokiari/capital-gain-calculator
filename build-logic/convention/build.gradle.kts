plugins {
    `kotlin-dsl`
}

group = "pl.deniotokiari.capital.gain.calculator.buildlogic"

dependencies {
    compileOnly(libs.android.gradlePlugin)
    compileOnly(libs.kotlin.gradlePlugin)
    compileOnly(libs.compose.gradlePlugin)
}

gradlePlugin {
    plugins {
        register("commonComposeMultiplatform") {
            id = "pl.deniotokiari.capital.gain.calculator.common"
            implementationClass = "pl.deniotokiari.capital.gain.calculator.buildlogic.CommonComposeMultiplatformPlugin"
        }

        register("androidIosComposeMultiplatform") {
            id = "pl.deniotokiari.capital.gain.calculator.androidios"
            implementationClass = "pl.deniotokiari.capital.gain.calculator.buildlogic.AndroidIosComposeMultiplatformPlugin"
        }

        register("webComposeMultiplatform") {
            id = "pl.deniotokiari.capital.gain.calculator.web"
            implementationClass = "pl.deniotokiari.capital.gain.calculator.buildlogic.WebComposeMultiplatformPlugin"
        }
    }
}