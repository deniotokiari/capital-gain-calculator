import org.jetbrains.kotlin.gradle.ExperimentalKotlinGradlePluginApi
        import org.jetbrains.kotlin.gradle.dsl.JvmTarget

        plugins {
            alias(libs.plugins.kotlinMultiplatform)
            alias(libs.plugins.androidLibrary)
            alias(libs.plugins.jetbrainsCompose)
            alias(libs.plugins.compose.compiler)
        }

kotlin {
    androidTarget {
        @OptIn(ExperimentalKotlinGradlePluginApi::class)
        compilerOptions {
            jvmTarget.set(JvmTarget.JVM_17)
        }
    }

    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "auth"
            isStatic = true
        }
    }

    sourceSets {
        commonMain.dependencies {
            implementation(compose.runtime)
            implementation(libs.firebase.auth)
        }
        commonTest.dependencies {
            implementation(libs.kotlin.test)
        }
    }
}

android {
    namespace = "pl.deniotokiari.capital.gain.calculator.feature.auth"
    compileSdk = libs.versions.android.compileSdk.get().toInt()
    defaultConfig {
        minSdk = libs.versions.android.minSdk.get().toInt()
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
