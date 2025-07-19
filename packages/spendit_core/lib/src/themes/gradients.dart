import 'package:flutter/material.dart';

abstract final class SiGradients {
  const SiGradients._();

  static const LinearGradient vibrantIndigoToSkyBlue = LinearGradient(
    colors: [Color(0xFF6C4FF6), Color(0xFF00CFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient mintToSkyBlue = LinearGradient(
    colors: [Color(0xFF4FFFB0), Color(0xFF00CFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient amberToPink = LinearGradient(
    colors: [Color(0xFFFFB547), Color(0xFFFF4F7B)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient indigoToMint = LinearGradient(
    colors: [Color(0xFF6C4FF6), Color(0xFF4FFFB0)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
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
