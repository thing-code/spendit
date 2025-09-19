import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
    progressIndicatorTheme: ProgressIndicatorThemeData(
      // ignore: deprecated_member_use
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
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
    ),
  );
}
