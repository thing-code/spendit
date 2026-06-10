import { Stack } from "expo-router";
import ".././global.css";

export default function RootLayout() {
  return (
    <Stack>
      <Stack.Screen options={{
        title: "Home",
        headerShown: false,
      }} name="(main)">
      </Stack.Screen>
    </Stack>
  );
}