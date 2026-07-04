import { ExpoConfig } from "expo/config";

const config: ExpoConfig = {
  name: process.env.EXPO_PUBLIC_APP_NAME || "Spendit",
  slug: "spendit",
  version: "1.0.0",
  orientation: "portrait",
  icon: "./assets/images/icon.png",
  scheme: "spendit",
  userInterfaceStyle: "dark",
  ios: {
    bundleIdentifier: "com.thingcode.spendit",
    icon: "./assets/spendit.icon",
  },
  android: {
    package: "com.thingcode.spendit",
    adaptiveIcon: {
      backgroundColor: "#E6F4FE",
      foregroundImage: "./assets/images/android-icon-foreground.png",
      monochromeImage: "./assets/images/android-icon-monochrome.png",
    },
    predictiveBackGestureEnabled: false,
  },
  web: {
    output: "static",
    favicon: "./assets/images/favicon.png",
  },
  plugins: [
    "expo-router",
    "expo-image",
    "expo-status-bar",
    "expo-web-browser",
    [
      "expo-splash-screen",
      {
        backgroundColor: "#208AEF",
        android: {
          image: "./assets/images/splash-icon.png",
          imageWidth: 76,
        },
      },
    ],
    [
      "expo-font",
      {
        fonts: [
          "./assets/fonts/SpaceGrotesk-Bold.ttf",
          "./assets/fonts/SpaceGrotesk-Medium.ttf",
          "./assets/fonts/SpaceGrotesk-Regular.ttf",
          "./assets/fonts/SpaceGrotesk-Semibold.ttf",
          "./assets/fonts/Urbanist-Bold.ttf",
          "./assets/fonts/Urbanist-Medium.ttf",
          "./assets/fonts/Urbanist-Regular.ttf",
          "./assets/fonts/Urbanist-Semibold.ttf",
        ],
      },
    ],
  ],
  experiments: {
    typedRoutes: true,
    reactCompiler: true,
  },
  extra: {
    eas: {
      projectId: "b800ea21-3fd8-4543-bb5a-71e561588e78",
    },
  },
};

export default config;
