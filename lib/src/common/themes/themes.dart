import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:spendit/src/common/themes/colors.dart';

abstract final class SiThemes {
  const SiThemes._();

  static ThemeData light = ThemeData(
    fontFamily: 'SF Pro Display',
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: SiColors.primary,
      onPrimary: Colors.white,
      secondary: SiColors.secondary,
      onSecondary: SiColors.primary,
      tertiary: SiColors.accent,
      onTertiary: SiColors.primary,
      error: SiColors.danger,
      onError: Colors.white,
      surface: SiColors.background,
      onSurface: SiColors.primary,
    ),
    disabledColor: SiColors.grayscale3,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (_) => const PredictiveBackPageTransitionsBuilder(),
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
      backButtonIconBuilder: (context) => Icon(IconsaxPlusLinear.arrow_left_1),
    ),
  );
}
