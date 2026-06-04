import theme from "@/theme/theme";
import { StyleSheet, Text, View } from "react-native";

export default function Index() {
  return (
    <View style={styles.container}>
      <Text style={{ color: theme.colors.textPrimary, fontFamily: 'Space Grotesk', fontSize: 32, fontWeight: "600" }}>1234567890</Text>
      <Text style={{ color: theme.colors.textPrimary, fontFamily: 'Urbanist', fontSize: 32, fontWeight: "600" }}>1234567890</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: theme.colors.background
  },
});
