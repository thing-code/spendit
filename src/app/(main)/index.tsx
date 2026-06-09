import theme from "@/theme/theme";
import { ActivityIndicator, View } from "react-native";

export default function HomePage() {
  return (
    <>
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center" }}>
        <ActivityIndicator size="large" color={theme.colors.primary} />
      </View>
    </>
  );
}
