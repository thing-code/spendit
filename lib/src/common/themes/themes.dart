// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/common/themes/colors.dart';
import 'package:spendit/src/gen/fonts.gen.dart';

export 'colors.dart';

abstract final class SiThemes {
  const SiThemes._();

  static ThemeData light = ThemeData(
    fontFamily: FontFamily.manrope,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: SiColors.primary,
      onPrimary: Colors.white,
      secondary: SiColors.secondary,
      onSecondary: SiColors.primary,
      error: SiColors.danger,
      onError: Colors.white,
      surface: SiColors.background,
      onSurface: SiColors.primary,
    ),
    disabledColor: SiColors.grayscale3,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (_) => const FadeForwardsPageTransitionsBuilder(),
      ),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: SiColors.primary,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: SiColors.textPrimary,
      ),
      centerTitle: true,
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => HugeIcon(
        icon: HugeIcons.strokeRoundedArrowLeft01,
        color: SiColors.textPrimary,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      year2023: false,
      linearTrackColor: SiColors.grayscale2,
      circularTrackColor: SiColors.grayscale2,
      color: SiColors.secondary,
      stopIndicatorColor: SiColors.secondary,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: SiColors.grayscale2),
      ),
    ),
    dividerTheme: DividerThemeData(color: SiColors.grayscale2),
    checkboxTheme: CheckboxThemeData(),
    radioTheme: RadioThemeData(),
    switchTheme: SwitchThemeData(),
    sliderTheme: SliderThemeData(year2023: false),
    listTileTheme: ListTileThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
        fontSize: 14,
        color: SiColors.textSecondary,
        height: 1,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      enabledBorder: _border(SiColors.grayscale2),
      focusedBorder: _border(SiColors.primary),
      disabledBorder: _border(SiColors.textSecondary),
      errorBorder: _border(SiColors.danger),
      focusedErrorBorder: _border(SiColors.danger),
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
  );

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color, width: 1.2),
  );
}
