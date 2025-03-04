import 'package:flutter/material.dart';

abstract final class COSTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'SF Pro Display',
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF1C304F),
      primaryContainer: Color(0xFF98BBF5),
      onPrimary: Colors.white,
      secondary: Color(0xFFF17141),
      secondaryContainer: Color(0xFFFFECAE),
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF1E1E1E),
      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      errorContainer: Color(0xFFFFDAD6),
    ),
  );
  static ThemeData dark = ThemeData(
    fontFamily: 'SF Pro Display',
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF9FC9FF),
      primaryContainer: Color(0xFF1C304F),
      onPrimary: Color(0xFF1E1E1E),
      secondary: Color(0xFFFFB59D),
      secondaryContainer: Color(0xFFF17141),
      onSecondary: Color(0xFF1E1E1E),
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF1E1E1E),
    ),
  );
}
