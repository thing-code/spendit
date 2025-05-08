import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

abstract final class SpendItColors {
  const SpendItColors._();

  static const MaterialColor primaryColor = MaterialColor(0xFF232e3f, {
    50: Color(0xFFf5f7fa),
    100: Color(0xFFeaeef4),
    200: Color(0xFFd0dae7),
    300: Color(0xFFa6bcd3),
    400: Color(0xFF7697ba),
    500: Color(0xFF557aa2),
    600: Color(0xFF416188),
    700: Color(0xFF364e6e),
    800: Color(0xFF30445c),
    900: Color(0xFF2c3b4e),
    950: Color(0xFF232e3f),
  });

  static const Color warningColor = Color(0xFFffaa00);
  static const Color warningCardColor = Color(0xFFfff6c5);
  static const Color errorColor = Color(0xFFFF4D58);
  static const Color errorCardColor = Color(0xFFFCEDE7);
  static const Color successColor = Color(0xFF40DC60);
  static const Color successCardColor = Color(0xFFEFF8F2);
}

abstract final class SpendItTheme {
  const SpendItTheme._();

  static ThemeData normal({String? fontFamily}) => ThemeData(
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: SpendItColors.primaryColor,
      accentColor: SpendItColors.primaryColor.shade500,
      brightness: Brightness.light,
      cardColor: SpendItColors.primaryColor.shade50,
      backgroundColor: SpendItColors.primaryColor.shade50,
      errorColor: SpendItColors.errorColor,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (_) => const FadeForwardsPageTransitionsBuilder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      filled: true,
      isDense: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return SpendItColors.errorCardColor;
        }
        return SpendItColors.primaryColor.shade100;
      }),
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return SpendItColors.errorColor;
          }
          return SpendItColors.primaryColor.shade600;
        }),
      ),
      border: SpendItInputBorder(borderRadius: BorderRadius.circular(1000)),
      focusedBorder: SpendItInputBorder(
        borderRadius: BorderRadius.circular(1000),
      ),
      enabledBorder: SpendItInputBorder(
        borderRadius: BorderRadius.circular(1000),
      ),
      errorBorder: SpendItInputBorder(
        borderRadius: BorderRadius.circular(1000),
      ),
      disabledBorder: SpendItInputBorder(
        borderRadius: BorderRadius.circular(1000),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: Size.fromHeight(62),
        maximumSize: Size(double.infinity, 62),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        backgroundColor: SpendItColors.primaryColor,
        foregroundColor: SpendItColors.primaryColor.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(62),
        maximumSize: Size(double.infinity, 62),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        foregroundColor: SpendItColors.primaryColor.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
        side: BorderSide(
          color: SpendItColors.primaryColor.shade400,
          width: 1.6,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: Size.fromHeight(62),
        maximumSize: Size(double.infinity, 62),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        foregroundColor: SpendItColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    ),
  );
}
