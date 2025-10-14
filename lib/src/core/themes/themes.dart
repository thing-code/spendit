// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spendit/src/core/core.dart';

export 'colors.dart';
export 'shadows.dart';

abstract final class SiTheme {
  const SiTheme._();

  // Dark Theme
  static final ThemeData dark = ThemeData(
    fontFamily: FontFamily.manrope,
    brightness: Brightness.dark,
    primaryColor: SiColors.primary,
    colorScheme: ColorScheme.dark(
      primary: SiColors.primary,
      onPrimary: Colors.white,
      primaryContainer: SiColors.primaryContainer,
      secondary: SiColors.secondary,
      onSecondary: Colors.white,
      secondaryContainer: SiColors.secondaryContainer,
      surface: SiColors.surface,
      error: SiColors.danger,
      onError: Colors.white,
      onSurface: SiColors.textPrimary,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (_) => const FadeForwardsPageTransitionsBuilder(),
      ),
    ),
    disabledColor: SiColors.disabled,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: SiColors.textPrimary,
        height: 1,
        fontSize: 14,
      ),
      bodyMedium: TextStyle(
        color: SiColors.textPrimary,
        height: 1.2,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        color: SiColors.textPrimary,
        height: 1.4,
        fontSize: 10,
      ),
      labelLarge: TextStyle(
        color: SiColors.textPrimary,
        height: 1,
        fontSize: 18,
      ),
      labelMedium: TextStyle(
        color: SiColors.textPrimary,
        height: 1.2,
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        color: SiColors.textPrimary,
        height: 1.4,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: SiColors.textPrimary,
        height: 1,
        fontSize: 22,
      ),
      titleMedium: TextStyle(
        color: SiColors.textPrimary,
        height: 1.2,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        color: SiColors.textPrimary,
        height: 1.4,
        fontSize: 18,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: SiColors.surface,
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      actionsPadding: EdgeInsets.only(right: 8),
      centerTitle: true,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(year2023: false),
    cardTheme: CardThemeData(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      elevation: 0,
      color: SiColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: SiColors.grayscale1),
      ),
    ),
    dividerTheme: DividerThemeData(color: SiColors.grayscale1),
    checkboxTheme: CheckboxThemeData(),
    radioTheme: RadioThemeData(),
    switchTheme: SwitchThemeData(),
    sliderTheme: SliderThemeData(year2023: false),
    listTileTheme: ListTileThemeData(),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: SiColors.primary,
      ),
      splashBorderRadius: BorderRadius.circular(12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: SiColors.card,
      hintStyle: TextStyle(
        fontSize: 14,
        color: SiColors.textSecondary,
        height: 1,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      enabledBorder: _border(SiColors.card),
      focusedBorder: _border(SiColors.primary),
      disabledBorder: _border(SiColors.disabled),
      errorBorder: _border(SiColors.danger),
      focusedErrorBorder: _border(SiColors.danger),
    ),
  );

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );
}
