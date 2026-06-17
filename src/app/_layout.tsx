import { DarkTheme, Stack, ThemeProvider } from "expo-router";
import ".././global.css";

export default function RootLayout() {
  return (
    <ThemeProvider value={DarkTheme}>
      <Stack>
        <Stack.Screen
          options={{
            title: "Home",
          }}
          name="(main)"
        />
      </Stack>
    </ThemeProvider>
  );
}
