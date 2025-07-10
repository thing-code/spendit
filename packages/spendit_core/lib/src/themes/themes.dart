// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'styles.dart';

export 'styles.dart';

abstract final class SIColors {
  const SIColors._();

  static const Color primary = Color(0xff180048);
  static const Color secondary = Color.fromARGB(255, 69, 173, 161);
  static const Color backgroundWhite = Color(0xFFf5f7fa);
  static const Color backgroundLightGrey = Color(0xffdbe4ed);
  static const Color backgroundGrey = Color(0xffa6bcd3);
  static const Color warning = Color(0xFFfcb226);
  static const Color error = Color(0xFFf65454);
  static const Color success = Color(0xFF1bc760);
  static const Color text = Color(0xFF101720);
}

abstract final class SITheme {
  const SITheme._();

  static ThemeData get light {
    final fontFamily = 'Figtree';
    return ThemeData(
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: colorToMaterial(SIColors.primary),
        accentColor: SIColors.secondary,
        brightness: Brightness.light,
        cardColor: SIColors.backgroundWhite,
        backgroundColor: SIColors.backgroundLightGrey,
        errorColor: SIColors.error,
      ),
      scaffoldBackgroundColor: SIColors.backgroundLightGrey,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
          TargetPlatform.values,
          value: (_) => const PredictiveBackPageTransitionsBuilder(),
        ),
      ),
      inputDecorationTheme: _inputDecoration(fontFamily: fontFamily),
      filledButtonTheme: _filledButtonTheme(fontFamily: fontFamily),
      outlinedButtonTheme: _outlinedButtonTheme(fontFamily: fontFamily),
      textButtonTheme: _textButtonTheme(fontFamily: fontFamily),
      segmentedButtonTheme: SegmentedButtonThemeData(
        selectedIcon: const SizedBox(),
        style: SegmentedButton.styleFrom(),
      ),
      appBarTheme: _appBarTheme(fontFamily: fontFamily),
      cardTheme: _cardTheme(),
      datePickerTheme: DatePickerThemeData(),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        year2023: false,
        borderRadius: BorderRadius.circular(1000),
        color: SIColors.secondary,
        circularTrackColor: SIColors.backgroundGrey.withValues(alpha: .15),
        linearTrackColor: SIColors.backgroundGrey.withValues(alpha: .15),
        stopIndicatorColor: SIColors.secondary,
      ),
      sliderTheme: SliderThemeData(year2023: false),
    );
  }

  static CardThemeData _cardTheme() {
    return CardThemeData(
      shadowColor: SIColors.primary.withAlpha(100),
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  static AppBarTheme _appBarTheme({String? fontFamily}) => AppBarTheme(
    centerTitle: true,
    titleSpacing: 8,
    foregroundColor: SIColors.primary,
    backgroundColor: Colors.white.withAlpha(200),
    actionsPadding: EdgeInsets.symmetric(horizontal: 8),
    titleTextStyle: SITextStyles.medium.copyWith(
      fontSize: 16,
      color: SIColors.primary,
      fontFamily: fontFamily,
    ),
  );

  static TextButtonThemeData _textButtonTheme({String? fontFamily}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size(double.infinity, 56),
        textStyle: SITextStyles.medium.copyWith(fontSize: 14, fontFamily: fontFamily),
        foregroundColor: SIColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme({String? fontFamily}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size(double.infinity, 56),
        textStyle: SITextStyles.medium.copyWith(fontSize: 14, fontFamily: fontFamily),
        foregroundColor: SIColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        side: BorderSide(color: SIColors.secondary, width: 1.6),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme({String? fontFamily}) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size(double.infinity, 56),
        textStyle: SITextStyles.medium.copyWith(fontSize: 14, fontFamily: fontFamily),
        backgroundColor: SIColors.primary,
        foregroundColor: SIColors.backgroundLightGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      ),
    );
  }

  static InputDecorationTheme _inputDecoration({String? fontFamily}) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      filled: true,
      isDense: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return SIColors.error.withValues(alpha: .1);
        }
        return SIColors.backgroundLightGrey;
      }),
      labelStyle: SITextStyles.medium.copyWith(
        fontSize: 14,
        fontFamily: fontFamily,
        color: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return SIColors.error;
          }
          return SIColors.primary;
        }),
      ),
      prefixIconColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return SIColors.error;
        }
        return SIColors.primary;
      }),
      suffixIconColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return SIColors.error;
        }
        return SIColors.primary;
      }),
      border: SIInputBorder(borderRadius: BorderRadius.circular(1000)),
      focusedBorder: SIInputBorder(borderRadius: BorderRadius.circular(1000)),
      enabledBorder: SIInputBorder(borderRadius: BorderRadius.circular(1000)),
      errorBorder: SIInputBorder(borderRadius: BorderRadius.circular(1000)),
      disabledBorder: SIInputBorder(borderRadius: BorderRadius.circular(1000)),
    );
  }
}

MaterialColor colorToMaterial(Color color) {
  final int red = (color.r * 255).round() & 0xff;
  final int green = (color.g * 255).round() & 0xff;
  final int blue = (color.b * 255).round() & 0xff;

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.toARGB32(), shades);
}
