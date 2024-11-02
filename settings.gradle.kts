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
include(":feature:settings")
include(":gateway")
include(":ui-kit")
include("core:misc:platform:android-ios")
include("core:misc:platform:common")
include("core:misc:platform:shared")
include("core:misc:platform:web")
include("feature:auth:platform:android-ios")
include("feature:auth:platform:common")
include("feature:auth:platform:shared")
include("feature:auth:platform:web")
include("feature:portfolio")