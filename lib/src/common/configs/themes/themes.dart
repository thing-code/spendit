import 'package:flutter/material.dart';

abstract final class COSTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'SF Pro Display',
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: CosColors.primaryColor,
      primaryContainer: CosColors.primaryColor.shade200,
      onPrimary: CosColors.primaryColor.shade50,
      secondary: CosColors.secondaryColor,
      secondaryContainer: CosColors.secondaryColor.shade100,
      onSecondary: Colors.black,
      surface: CosColors.primaryColor.shade100,
      onSurface: CosColors.primaryColor,
      error: Colors.redAccent,
      onError: Colors.white,
      errorContainer: Colors.red.shade50,
    ),
  );
}

abstract final class CosColors {
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
}
