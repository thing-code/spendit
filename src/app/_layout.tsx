import theme from "@/theme/theme";
import { Stack } from "expo-router";

export default function RootLayout() {
  return (
    <Stack>
      <Stack.Screen options={{
        title: "Home",
      }} name="(main)">
        <Stack.Header style={{
          backgroundColor: theme.colors.background,
          color: theme.colors.textPrimary
        }} hidden>
        </Stack.Header>
      </Stack.Screen>
    </Stack>
  );
}
