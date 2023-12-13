import com.android.build.gradle.internal.cxx.configure.gradleLocalProperties

@Suppress("DSL_SCOPE_VIOLATION") // TODO: Remove once KTIJ-19369 is fixed
plugins {
    alias(libs.plugins.com.android.application)
    alias(libs.plugins.org.jetbrains.kotlin.android)
    alias(libs.plugins.com.google.devtools.ksp)
    id("kotlin-parcelize")
}

android {
    namespace = "pl.deniotokiari.capitalgaincalculator"
    compileSdk = 34

    defaultConfig {
        applicationId = "pl.deniotokiari.capitalgaincalculator"
        minSdk = 26
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }

        fun getYahooApiKeys(value: String): String {
            val result = mutableListOf<String>()
            val items = value.split(",")

            items.forEach { item ->
                result.add("\"${item}\"")
            }

            return "{${result.joinToString(",")}}"
        }

        buildConfigField(
            "String",
            "ALPHA_VANTAGE_API_KEY",
            "\"${gradleLocalProperties(rootDir).getProperty("alphavantage.api.keys")}\""
        )
        buildConfigField(
            "String",
            "POLIGON_API_KEY",
            "\"${gradleLocalProperties(rootDir).getProperty("poligon.api.key")}\""
        )
        buildConfigField(
            "String[]",
            "YAHOO_FINANCE_API_KEYS",
            getYahooApiKeys(gradleLocalProperties(rootDir).getProperty("yahoo.finance.api.keys"))
        )
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }
    buildFeatures {
        compose = true
        buildConfig = true
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.4.3"
    }
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
}

dependencies {
    implementation(project(":core:ui"))
    implementation(project(":core:network"))
    implementation(project(":navigation"))

    implementation(project(":data:currency"))
    implementation(project(":data:profile"))

    implementation(project(":feature:init-profile"))
    implementation(project(":feature:home"))

    implementation(project(":domain"))

    implementation(libs.core.ktx)
    implementation(libs.lifecycle.runtime.ktx)
    implementation(libs.activity.compose)
    implementation(libs.ui)
    implementation(libs.ui.graphics)
    implementation(libs.ui.tooling.preview)
    implementation(libs.material3)
    implementation(libs.data.store)
    implementation(libs.koin.android)
    implementation(libs.koin.compose)
    implementation(libs.koin.workmanager)
    implementation(libs.koin.annotations)
    ksp(libs.koin.ksp)
    implementation(libs.navigation.compose)
    implementation(libs.okhttp3)
    implementation(libs.room.runtime)
    implementation(libs.room.ktx)
    annotationProcessor(libs.room.compiler)
    ksp(libs.room.compiler)
    implementation(libs.startup)
    implementation(libs.work)
    implementation(libs.compose.lifecycle)
    implementation(libs.retrofit)
    implementation(libs.moshi)
    implementation(libs.retrofit.moshi)
    implementation(libs.accompanist)
    implementation(libs.foundation)

    testImplementation(libs.junit)
    testImplementation(libs.kotlinx.coroutines.test)
    testImplementation(libs.mockito.kotlin)

    androidTestImplementation(libs.androidx.test.ext.junit)
    androidTestImplementation(libs.espresso.core)
    androidTestImplementation(libs.ui.test.junit4)

    debugImplementation(libs.ui.tooling)
    debugImplementation(libs.ui.test.manifest)
}