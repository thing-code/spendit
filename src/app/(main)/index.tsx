import theme from "@/theme/theme";
import { Image } from "expo-image";
import { SymbolView } from "expo-symbols";
import { ScrollView, Text, TouchableOpacity, View } from "react-native";
import { useSafeAreaInsets } from "react-native-safe-area-context";


export default function HomePage() {
  const insets = useSafeAreaInsets()

  return (
    <>
      <View style={{ backgroundColor: theme.colors.background, paddingTop: insets.top + 8, paddingBottom: 12, flexDirection: 'row', paddingHorizontal: 16, justifyContent: "space-between", alignItems: "center" }}>
        <View style={{ flexDirection: "row", gap: 12 }}>
          <Image source={{ uri: "https://images.unsplash.com/photo-1580128660010-fd027e1e587a?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" }} style={{ width: 40, height: 40, objectFit: "cover", borderRadius: 40, borderColor: theme.colors.divider, borderWidth: 2 }}></Image>
          <View style={{ flexDirection: "column", justifyContent: "center"}}>
            <Text style={{ color: theme.colors.textPrimary, fontSize: 12, fontFamily: theme.fontFamily.urbanist, fontWeight: "300" }}>Welcome Back</Text>
            <Text style={{ color: theme.colors.textPrimary, fontSize: 16, fontFamily: theme.fontFamily.spaceGrotesk, fontWeight: "600" }}>Adriano Pochetino</Text>
          </View>
        </View>
        <TouchableOpacity className="w-8 justify-items-center bg-surface">
          <SymbolView name={{ ios: "bell", android: "notifications" }} size={28} tintColor={theme.colors.textPrimary} />
        </TouchableOpacity>
      </View>
      <ScrollView className="p-4">
        <Text className="text-6xl font-urbanist-bold">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
        <Text className="text-6xl">Item Item Item</Text>
      </ScrollView>
    </>
  );
}
