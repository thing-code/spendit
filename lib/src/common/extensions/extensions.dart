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
