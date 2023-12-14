pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "Capital Gain Calculator"
include(":app")
include(":core:ui")
include(":navigation")
include(":feature:init-profile")
include(":data:currency")
include(":core:network")
include(":core:common")
include(":domain")
include(":data:profile")
include(":feature:home")
include(":data:portfolio")
