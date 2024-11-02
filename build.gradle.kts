plugins {
    // this is necessary to avoid the plugins to be loaded multiple times
    // in each subproject's classloader
    alias(libs.plugins.androidApplication) apply false
    alias(libs.plugins.androidLibrary) apply false
    alias(libs.plugins.jetbrainsCompose) apply false
    alias(libs.plugins.compose.compiler) apply false
    alias(libs.plugins.kotlinMultiplatform) apply false
    alias(libs.plugins.kotlin.serialization) apply false
    alias(libs.plugins.google.services) apply false
    alias(libs.plugins.ktlint) apply false
    alias(libs.plugins.kover) apply false
    alias(libs.plugins.dagp) apply false
}

subprojects {
    if (subprojects.size == 0) {
        apply(plugin = "com.autonomousapps.dependency-analysis")
        apply(plugin = "org.jlleitschuh.gradle.ktlint")

        tasks.withType(com.autonomousapps.tasks.CodeSourceExploderTask::class.java) {
            dependsOn("generateActualResourceCollectorsForAndroidMain")
        }

        configure<org.jlleitschuh.gradle.ktlint.KtlintExtension> {
            filter {
                exclude("**/generated/**")
            }
        }
    }
}
