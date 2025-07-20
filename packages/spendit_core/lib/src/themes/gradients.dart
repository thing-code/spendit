import 'package:flutter/material.dart';

abstract final class SiGradients {
  const SiGradients._();

  static const LinearGradient indigoToSkyBlue = LinearGradient(
    colors: [Color(0xFF6C4FF6), Color(0xFF00CFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const RadialGradient indigoToSkyBlue2 = RadialGradient(
    colors: [Color(0xFF6C4FF6), Color(0xFF00CFFF)],
    center: Alignment(0, 0),
    radius: 2,
  );

  static const LinearGradient darkSurface = LinearGradient(
    colors: [Color(0xFF1C1B29), Color(0xFF2A2B3C)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient fancyRainbow = LinearGradient(
    colors: [Color(0xFF00CFFF), Color(0xFF6C4FF6), Color(0xFFFF4F7B)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
