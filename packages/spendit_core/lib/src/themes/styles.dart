import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class SIInputBorder extends UnderlineInputBorder {
  const SIInputBorder({super.borderRadius, super.borderSide = BorderSide.none});

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint();
    canvas.drawRRect(center, paint);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is SIInputBorder) {
      return SIInputBorder(
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    return lerpTo(a, 1 - t);
  }
}

abstract final class SITextStyles {
  const SITextStyles._();

  static TextStyle bold = TextStyle(fontWeight: FontWeight.bold, height: 1.4, color: SIColors.text);
  static TextStyle semibold = TextStyle(
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: SIColors.text,
  );
  static TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: SIColors.text,
  );
  static TextStyle regular = TextStyle(
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: SIColors.text,
  );
  static TextStyle light = TextStyle(
    fontWeight: FontWeight.bold,
    height: 1.4,
    color: SIColors.text,
  );
}

abstract final class SIStyles {
  const SIStyles._();

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: SIColors.primary.withValues(alpha: .1),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];
}
