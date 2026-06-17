import theme from "@/theme/theme";
import { Notification01Icon } from "@hugeicons/core-free-icons";
import { HugeiconsIcon } from "@hugeicons/react-native";
import { Image } from "expo-image";
import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import { EdgeInsets, useSafeAreaInsets } from "react-native-safe-area-context";

const HomeHeader = () => {
  const insets = useSafeAreaInsets();
  return (
    <>
      <View style={styles(insets).headerContainer}>
        <View className="flex-row gap-3">
          <Image
            source={{
              uri: "https://images.unsplash.com/photo-1580128660010-fd027e1e587a?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            }}
            style={styles(insets).avatar}
          ></Image>
          <View className="flex-col justify-center">
            <Text className="text-text-secondary text-xs font-light font-urbanist">
              Welcome Back
            </Text>
            <Text className="text-text-primary text-base font-space-grotesk font-semibold">
              Adriano Pochetino
            </Text>
          </View>
        </View>
        <TouchableOpacity className="w-8 justify-items-center bg-surface">
          <HugeiconsIcon
            icon={Notification01Icon}
            size={28}
            color={theme.colors.textPrimary}
          />
        </TouchableOpacity>
      </View>
    </>
  );
};

const styles = (insets: EdgeInsets) => {
  return StyleSheet.create({
    headerContainer: {
      backgroundColor: theme.colors.background,
      paddingTop: insets.top + 8,
      paddingBottom: 12,
      flexDirection: "row",
      paddingHorizontal: 16,
      justifyContent: "space-between",
      alignItems: "center",
    },
    avatar: {
      width: 40,
      borderRadius: 40,
      objectFit: "cover",
      borderColor: theme.colors.divider,
      borderWidth: 1.5,
    },
  });
};

export default HomeHeader;
