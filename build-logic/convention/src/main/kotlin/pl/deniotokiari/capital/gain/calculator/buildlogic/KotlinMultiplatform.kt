package pl.deniotokiari.capital.gain.calculator.buildlogic

import org.gradle.api.Project
import org.jetbrains.kotlin.gradle.ExperimentalKotlinGradlePluginApi
import org.jetbrains.kotlin.gradle.ExperimentalWasmDsl
import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.dsl.KotlinMultiplatformExtension

@OptIn(ExperimentalWasmDsl::class, ExperimentalKotlinGradlePluginApi::class)
internal fun Project.configureKotlinMultiplatform(
    types: List<ProjectType>,
    extension: KotlinMultiplatformExtension,
) =
    extension.apply {
        types.forEach { type ->
            when (type) {
                ProjectType.Android -> {
                    androidTarget {
                        compilerOptions {
                            jvmTarget.set(JvmTarget.JVM_17)
                        }
                    }
                }

                ProjectType.Ios -> {
                    listOf(
                        iosX64(),
                        iosArm64(),
                        iosSimulatorArm64()
                    ).forEach { target ->
                        target.binaries.framework {
                            baseName = path.split(":").last()
                            isStatic = true
                        }
                    }
                }

                ProjectType.Web -> {
                    androidTarget()
                    wasmJs().browser()
                }
            }
        }
    }

sealed interface ProjectType {
    object Android : ProjectType
    object Ios : ProjectType
    object Web : ProjectType
}