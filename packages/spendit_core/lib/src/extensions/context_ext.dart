import 'package:flutter/widgets.dart';

extension ContextExt on BuildContext {
  double get deviceHeight => MediaQuery.sizeOf(this).height;
  double get deviceWidth => MediaQuery.sizeOf(this).width;
  double get statusBarHeight => MediaQuery.viewPaddingOf(this).top;
  double get bottomPadding => MediaQuery.viewPaddingOf(this).bottom;
}
