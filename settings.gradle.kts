@file:Suppress("UnstableApiUsage")

rootProject.name = "capital-gain-calculator"
enableFeaturePreview("TYPESAFE_PROJECT_ACCESSORS")

pluginManagement {
    includeBuild("build-logic")
    repositories {
        google {
            mavenContent {
                includeGroupAndSubgroups("androidx")
                includeGroupAndSubgroups("com.android")
                includeGroupAndSubgroups("com.google")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositories {
        google {
            mavenContent {
                includeGroupAndSubgroups("androidx")
                includeGroupAndSubgroups("com.android")
                includeGroupAndSubgroups("com.google")
            }
        }
        mavenCentral()
        maven("https://maven.pkg.jetbrains.space/kotlin/p/wasm/experimental")
    }
}

include(":composeApp")
include(":core:misc")
include(":core:navigation")
include(":core:test")
include(":feature:auth")
include(":feature:currency")
include(":feature:home")
include(":gateway")
include(":platform:android-ios:auth")
include(":platform:common:auth")
include(":platform:web:auth")
include(":ui-kit")
