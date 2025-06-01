// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'styles.dart';

export 'styles.dart';

abstract final class SpendItColors {
  const SpendItColors._();

  static const _primary = 0xFF232e3f;

  static const _secondary = 0xffffa900;

  static const _accent = 0xffa6bcd3;

  static const MaterialColor primaryColor = MaterialColor(_primary, {
    100: Color(0xffd3d5d9),
    200: Color(0xffa7abb2),
    300: Color(0xff7b828c),
    400: Color(0xff4f5865),
    500: Color(0xff232e3f),
    600: Color(0xff1c2532),
    700: Color(0xff151c26),
    800: Color(0xff0e1219),
    900: Color(0xff07090d),
  });

  static const MaterialColor secondaryColor = MaterialColor(_secondary, {
    100: Color(0xffffeecc),
    200: Color(0xffffdd99),
    300: Color(0xffffcb66),
    400: Color(0xffffba33),
    500: Color(0xffffa900),
    600: Color(0xffcc8700),
    700: Color(0xff996500),
    800: Color(0xff664400),
    900: Color(0xff332200),
  });

  static const MaterialColor accentColor = MaterialColor(_accent, {
    100: Color(0xffedf2f6),
    200: Color(0xffdbe4ed),
    300: Color(0xffcad7e5),
    400: Color(0xffb8c9dc),
    500: Color(0xffa6bcd3),
    600: Color(0xff8596a9),
    700: Color(0xff64717f),
    800: Color(0xff424b54),
    900: Color(0xff21262a),
  });

  static const Color neutralColor = Color(0xFFf5f7fa);

  static const Color warningColor = Color(0xFFffaa00);

  static const Color warningCardColor = Color(0xFFfff6c5);

  static const Color errorColor = Color(0xFFFF4D58);

  static const Color errorCardColor = Color(0xFFFCEDE7);

  static const Color successColor = Color(0xFF40DC60);

  static const Color successCardColor = Color(0xFFEFF8F2);
}

abstract final class SpendItTheme {
  const SpendItTheme._();

  static ThemeData light({String? fontFamily}) => ThemeData(
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: SpendItColors.primaryColor,
      accentColor: SpendItColors.accentColor,
      brightness: Brightness.light,
      cardColor: SpendItColors.neutralColor,
      backgroundColor: SpendItColors.accentColor.shade200,
      errorColor: SpendItColors.errorColor,
    ),
    scaffoldBackgroundColor: SpendItColors.accentColor.shade200,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (_) => const FadeForwardsPageTransitionsBuilder(),
      ),
    ),
    inputDecorationTheme: _inputDecoration(),
    filledButtonTheme: _filledButtonTheme(),
    outlinedButtonTheme: _outlinedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    appBarTheme: _appBarTheme(),
    cardTheme: _cardTheme(),
    datePickerTheme: DatePickerThemeData(),
    progressIndicatorTheme: ProgressIndicatorThemeData(year2023: false),
    sliderTheme: SliderThemeData(year2023: false),
  );

  static CardThemeData _cardTheme() {
    return CardThemeData(
      shadowColor: SpendItColors.primaryColor.withAlpha(100),
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  static AppBarTheme _appBarTheme() => AppBarTheme(
    centerTitle: true,
    titleSpacing: 8,
    foregroundColor: SpendItColors.primaryColor,
    backgroundColor: Colors.white.withAlpha(200),
    actionsPadding: EdgeInsets.symmetric(horizontal: 8),
    titleTextStyle: SpendItTextStyles.medium.copyWith(
      fontSize: 16,
      color: SpendItColors.primaryColor,
    ),
  );

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size(double.infinity, 56),
        textStyle: SpendItTextStyles.medium.copyWith(fontSize: 16),
        foregroundColor: SpendItColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size(double.infinity, 56),
        textStyle: SpendItTextStyles.medium.copyWith(fontSize: 16),
        foregroundColor: SpendItColors.secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        side: BorderSide(color: SpendItColors.secondaryColor, width: 1.6),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size(double.infinity, 56),
        textStyle: SpendItTextStyles.medium.copyWith(fontSize: 16),
        backgroundColor: SpendItColors.primaryColor,
        foregroundColor: SpendItColors.accentColor.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      ),
    );
  }

  static InputDecorationTheme _inputDecoration() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      filled: true,
      isDense: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return SpendItColors.errorCardColor;
        }
        return SpendItColors.accentColor.shade200;
      }),
      labelStyle: SpendItTextStyles.medium.copyWith(
        fontSize: 14,
        color: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return SpendItColors.errorColor;
          }
          return SpendItColors.primaryColor.shade800;
        }),
      ),
      prefixIconColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return SpendItColors.errorColor;
        }
        return SpendItColors.primaryColor.shade800;
      }),
      suffixIconColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return SpendItColors.errorColor;
        }
        return SpendItColors.primaryColor.shade800;
      }),
      border: SpendItInputBorder(borderRadius: BorderRadius.circular(1000)),
      focusedBorder: SpendItInputBorder(borderRadius: BorderRadius.circular(1000)),
      enabledBorder: SpendItInputBorder(borderRadius: BorderRadius.circular(1000)),
      errorBorder: SpendItInputBorder(borderRadius: BorderRadius.circular(1000)),
      disabledBorder: SpendItInputBorder(borderRadius: BorderRadius.circular(1000)),
    );
  }
}
