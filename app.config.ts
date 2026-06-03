import { ExpoConfig } from "expo/config"

const config: ExpoConfig = {
    name: process.env.EXPO_PUBLIC_APP_NAME || "Spendit",
    slug: "spendit",
    version: "1.0.0",
    orientation: "portrait",
    icon: "./assets/images/icon.png",
    scheme: "spendit",
    userInterfaceStyle: "automatic",
    ios: {
        bundleIdentifier: "com.thingcode.spendit",
        icon: "./assets/spendit.icon"
    },
    android: {
        package: "com.thingcode.spendit",
        adaptiveIcon: {
            backgroundColor: "#E6F4FE",
            foregroundImage: "./assets/images/android-icon-foreground.png",
            monochromeImage: "./assets/images/android-icon-monochrome.png",
        },
        predictiveBackGestureEnabled: false
    },
    web: {
        output: "static",
        favicon: "./assets/images/favicon.png"
    },
    plugins: [
        "expo-router",
        [
            "expo-splash-screen",
            {
                backgroundColor: "#208AEF",
                android: {
                    image: "./assets/images/splash-icon.png",
                    imageWidth: 76
                }
            }
        ]
    ],
    experiments: {
        typedRoutes: true,
        reactCompiler: true
    }
}

export default config