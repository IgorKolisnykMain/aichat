import java.util.Properties
import java.io.FileInputStream

val developmentKeystoreProperties = Properties()
val developmentKeystorePropertiesFile = rootProject.file("app/development_key.properties")
if (developmentKeystorePropertiesFile.exists()) {
    developmentKeystoreProperties.load(FileInputStream(developmentKeystorePropertiesFile))
}

val productionKeystoreProperties = Properties()
val productionKeystorePropertiesFile = rootProject.file("app/production_key.properties")
if (productionKeystorePropertiesFile.exists()) {
    productionKeystoreProperties.load(FileInputStream(productionKeystorePropertiesFile))
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.pet.aichat"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    signingConfigs {
        create("development") {
            keyAlias = developmentKeystoreProperties["keyAlias"] as String?
            keyPassword = developmentKeystoreProperties["keyPassword"] as String?
            storeFile = developmentKeystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = developmentKeystoreProperties["storePassword"] as String?
        }
        create("production") {
            keyAlias = productionKeystoreProperties["keyAlias"] as String?
            keyPassword = productionKeystoreProperties["keyPassword"] as String?
            storeFile = productionKeystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = productionKeystoreProperties["storePassword"] as String?
        }
    }

    flavorDimensions += "environment"
    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationId = "com.pet.aichat.dev"
            resValue("string", "app_name", "AiChat Dev")
            signingConfig = signingConfigs.getByName("development")
        }
        create("prod") {
            dimension = "environment"
            applicationId = "com.pet.aichat"
            resValue("string", "app_name", "AiChat")
            signingConfig = signingConfigs.getByName("production")
        }
    }

    defaultConfig {
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("debug") {
            signingConfig = null
        }
        getByName("release") {
            signingConfig = null
        }
    }
    
}

flutter {
    source = "../.."
}