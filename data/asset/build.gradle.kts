@Suppress("DSL_SCOPE_VIOLATION") // TODO: Remove once KTIJ-19369 is fixed
plugins {
    alias(libs.plugins.androidLibrary)
    alias(libs.plugins.org.jetbrains.kotlin.android)
    alias(libs.plugins.com.google.devtools.ksp)
}

android {
    namespace = "pl.deniotokiari.data.asset"
    compileSdk = 34

    defaultConfig {
        minSdk = 26

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        consumerProguardFiles("consumer-rules.pro")
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.4.3"
    }
    buildFeatures {
        compose = true
    }
}

dependencies {
    implementation(project(":core:common"))

    implementation(libs.core.ktx)
    implementation(libs.material3)
    implementation(libs.navigation.compose)
    implementation(libs.accompanist)
    implementation(libs.koin.android)
    implementation(libs.koin.compose)
    implementation(libs.koin.workmanager)
    implementation(libs.koin.annotations)
    ksp(libs.koin.ksp)
    implementation(libs.room.runtime)
    implementation(libs.room.ktx)
    annotationProcessor(libs.room.compiler)
    ksp(libs.room.compiler)

    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.test.ext.junit)
    androidTestImplementation(libs.espresso.core)
}