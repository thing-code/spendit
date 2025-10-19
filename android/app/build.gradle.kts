import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "id.thing_code.spend_it"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "id.thing_code.spend_it"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {                                                                      
         create("release") {                                                               
             val keyProperties = Properties()                                    
             val keyPropertiesFile = rootProject.file("key.properties")                    
             if (keyPropertiesFile.exists()) {                                             
                 keyProperties.load(FileInputStream(keyPropertiesFile))            
             }                                                                             
                                                                                           
             keyAlias = keyProperties.getProperty("keyAlias")                             
             keyPassword = keyProperties.getProperty("keyPassword")                        
             storeFile = file(keyProperties.getProperty("storeFile"))                     
             storePassword = keyProperties.getProperty("storePassword")                   
         }                                                                                 
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
