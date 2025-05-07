import 'package:flutter/material.dart';

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

  static const MaterialColor secondaryColor = MaterialColor(0xFFffaa00, {
    50: Color(0xFFfffdea),
    100: Color(0xFFfff6c5),
    200: Color(0xFFffee85),
    300: Color(0xFFffde46),
    400: Color(0xFFffcc1b),
    500: Color(0xFFffaa00),
    600: Color(0xFFe28100),
    700: Color(0xFFbb5902),
    800: Color(0xFF984508),
    900: Color(0xFF7c380b),
    950: Color(0xFF481c00),
  });

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
      accentColor: SpendItColors.secondaryColor,
      brightness: Brightness.light,
      cardColor: SpendItColors.primaryColor.shade200,
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      filled: true,
      fillColor: SpendItColors.primaryColor.shade50,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(1000),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: Size.fromHeight(48),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        backgroundColor: SpendItColors.primaryColor,
        foregroundColor: SpendItColors.primaryColor.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(48),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
        side: BorderSide(color: Colors.white, width: 1.6),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        fixedSize: Size.fromHeight(48),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        foregroundColor: SpendItColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    ),
  );
}
