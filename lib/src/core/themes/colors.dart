import 'package:flutter/material.dart';

abstract final class SiColors {
  const SiColors._();

  static const Color primary = Color(0xFF6C7BFF);
  static const Color primaryContainer = Color(0xFF1A1D3C);
  static const Color secondary = Color(0xFFFFA63B);
  static const Color secondaryContainer = Color(0xFF3C2A15);

  static const Color surface = Color(0xFF1E1E2E);
  static const Color card = Color(0xFF252537);

  static const Color grayscale1 = Color(0xFF2A2A2A);
  static const Color grayscale2 = Color(0xFF3F3F3F);
  static const Color grayscale3 = Color(0xFF6E6E6E);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);

  static const Color disabled = Color.fromARGB(255, 162, 162, 162);

  static const Color success = Color(0xFF40DC60);
  static const Color info = Color(0xFF5A9BFF);
  static const Color danger = Color(0xFFFF6B75);
  static const Color warning = Color(0xFFFEC64B);

  static const Color successContainer = Color(0xFF16361D);
  static const Color infoContainer = Color(0xFF0E2647);
  static const Color dangerContainer = Color(0xFF471C1C);
  static const Color warningContainer = Color(0xFF3D2D0F);
}
