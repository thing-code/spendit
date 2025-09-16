import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
}

extension DoubleX on double {
  Widget get space => Gap(this);
}
