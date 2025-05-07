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

  static const MaterialColor secondaryColor = MaterialColor(0xFFcf9421, {
    50: Color(0xFFfcf8ea),
    100: Color(0xFFf7f0ca),
    200: Color(0xFFf1dd97),
    300: Color(0xFFe9c45b),
    400: Color(0xFFe0ac2f),
    500: Color(0xFFcf9421),
    600: Color(0xFFb4731a),
    700: Color(0xFF905418),
    800: Color(0xFF78431b),
    900: Color(0xFF66391d),
    950: Color(0xFF3b1d0d),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      filled: true,
      fillColor: SpendItColors.primaryColor.shade50,
      
    ),
  );
}
