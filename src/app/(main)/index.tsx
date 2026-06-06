import theme from "@/theme/theme";
import { Alert, Button, StyleSheet, Text, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import "../../global.css";

export default function Index() {
  return (
    <>
      <SafeAreaView style={styles.container}>
        <View className="flex-1 p-4 bg-background">
          <Text className="font-space-grotesk-semibold text-xl text-text-primary">Balance</Text>
          <Text style={{ color: theme.colors.textPrimary, fontFamily: theme.fontFamily.spaceGrotesk, fontSize: 32, fontWeight: "600" }}>Rp 1.945.000</Text>
          <Button title="Show Modal" onPress={() => {
            Alert.alert("Keluar", "Apakah anda yakin untuk keluar?", [
              {
                text: "Tidak",
                onPress: () => { },
                style: "destructive"
              },
              {
                text: "Ya",
                onPress: () => { },
                style: "default"
              },

            ], {

            })
          }}></Button>
        </View>
      </SafeAreaView>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: theme.colors.background
  },
});
