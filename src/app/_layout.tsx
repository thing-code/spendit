import { colors } from "@/theme/colors";
import { DarkTheme, Stack, ThemeProvider } from "expo-router";
import ".././global.css";

export default function RootLayout() {
  return (
    <ThemeProvider value={DarkTheme}>
      <Stack>
        <Stack.Screen
          options={{
            title: "Home",
            headerTitleAlign: "center",
          }}
          name="(main)"
        >
          <Stack.Header
            style={{
              backgroundColor: colors.background,
            }}
          />
        </Stack.Screen>
      </Stack>
    </ThemeProvider>
  );
}
