import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.1.0.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///     :
/// );
abstract final class MyTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    fontFamily: 'SF Pro Display',
    colors: const FlexSchemeColor(
      // Custom colors
      primary: Color(0xFF1C304F),
      primaryContainer: Color(0xFF98BBF5),
      primaryLightRef: Color(0xFF1C304F),
      secondary: Color(0xFFF17141),
      secondaryContainer: Color(0xFFFFECAE),
      secondaryLightRef: Color(0xFFF17141),
      tertiary: Color(0xFF006875),
      tertiaryContainer: Color(0xFF95F0FF),
      tertiaryLightRef: Color(0xFF006875),
      appBarColor: Color(0xFFFFECAE),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    swapLegacyOnMaterial3: true,
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    fontFamily: 'SF Pro Display',
    colors: const FlexSchemeColor(
      // Custom colors
      primary: Color(0xFF9FC9FF),
      primaryContainer: Color(0xFF00325B),
      primaryLightRef: Color(0x00000000),
      secondary: Color(0xFFFFB59D),
      secondaryContainer: Color(0xFF872100),
      secondaryLightRef: Color(0x00000000),
      tertiary: Color(0xFF86D2E1),
      tertiaryContainer: Color(0xFF004E59),
      tertiaryLightRef: Color(0x00000000),
      appBarColor: Color(0xFFFFECAE),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    swapLegacyOnMaterial3: true,
  );
}
