import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ContextX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
}

extension DoubleX on num {
  Widget get space => Gap(toDouble());
}

extension WidgetX on Widget {
  Padding paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Padding paddingSymmetric({double v = 0, double h = 0}) => Padding(
    padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
    child: this,
  );

  Padding paddingOnly({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      bottom: bottom,
      top: top,
      left: left,
      right: right,
    ),
    child: this,
  );
}
