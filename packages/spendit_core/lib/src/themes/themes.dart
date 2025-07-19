// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

export 'styles.dart';

abstract final class SiColors {
  const SiColors._();

  static const Color primary = Color(0xFF6C4FF6);
  static const Color accent = Color(0xFF00CFFF);
  static const Color success = Color(0xFF4FFFB0);
  static const Color warning = Color(0xFFFFB547);
  static const Color danger = Color(0xFFFF4F7B);
  static const Color background = Color(0xFF1C1B29);
  static const Color surface = Color(0xFF2A2B3C);
  static const Color text = Color(0xFFFFFFFF);
  static const Color mutedText = Color(0xFFA9A7C1);
}

abstract final class SiTheme {
  const SiTheme._();

  static ThemeData get dark => ThemeData(
    fontFamily: 'Figtree',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SiColors.background,
    primaryColor: SiColors.primary,
    colorScheme: _colorScheme,
    cardColor: SiColors.surface,
    pageTransitionsTheme: _pageTransitionTheme,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: _textButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    progressIndicatorTheme: _progressTheme,
    actionIconTheme: _actionIconTheme,
    sliderTheme: SliderThemeData(year2023: false),
  );

  static ActionIconThemeData get _actionIconTheme {
    return ActionIconThemeData(
      backButtonIconBuilder: (context) {
        return Icon(IconsaxPlusLinear.arrow_left_1);
      },
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: SiColors.surface,
      foregroundColor: SiColors.text,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: SiColors.surface,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      constraints: BoxConstraints(minHeight: 48),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      helperStyle: TextStyle(fontSize: 12, color: SiColors.mutedText),
      hintStyle: TextStyle(color: SiColors.mutedText),
    );
  }

  static PageTransitionsTheme get _pageTransitionTheme {
    return PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (_) => const PredictiveBackPageTransitionsBuilder(),
      ),
    );
  }

  static ColorScheme get _colorScheme {
    return ColorScheme.dark(
      primary: SiColors.primary,
      secondary: SiColors.accent,
      background: SiColors.background,
      surface: SiColors.surface,
      error: SiColors.danger,
      onPrimary: SiColors.text,
      onSecondary: SiColors.text,
      onSurface: SiColors.text,
      onBackground: SiColors.text,
      onError: SiColors.text,
    );
  }

  static ProgressIndicatorThemeData get _progressTheme {
    return ProgressIndicatorThemeData(
      year2023: false,
      borderRadius: BorderRadius.circular(1000),
      color: SiColors.accent,
      circularTrackColor: SiColors.text.withValues(alpha: .2),
      linearTrackColor: SiColors.text.withValues(alpha: .2),
      stopIndicatorColor: SiColors.primary,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: SiColors.text,
        backgroundColor: SiColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size.fromHeight(48),
        maximumSize: Size.fromHeight(56),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size.fromHeight(56),
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        foregroundColor: SiColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        maximumSize: Size.fromHeight(56),
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        foregroundColor: SiColors.accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        side: BorderSide(
          color: SiColors.accent,
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
    );
  }
}
