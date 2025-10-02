import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

extension WidgetExtension on Widget {
  Widget skeleton() => Skeletonizer(child: this);
}
