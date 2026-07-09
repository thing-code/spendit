import { ScrollView, Text, View } from "react-native";

export default function HomePage() {
  return (
    <>
      <ScrollView className="p-4 bg-background">
        <View className="bg-surface p-4 rounded-2xl flex-col gap-2">
          <Text className="text-text-primary text-base font-urbanist-medium">
            Your Balance
          </Text>
          <Text className="text-text-primary text-4xl font-space-grotesk-bold">
            Rp 1.000.000
          </Text>
        </View>
      </ScrollView>
    </>
  );
}
