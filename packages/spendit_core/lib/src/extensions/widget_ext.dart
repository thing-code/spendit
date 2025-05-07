import 'package:flutter/widgets.dart';

extension Tappable on Widget {
  /// Wraps the widget with a tappable widget that can be used to handle taps.
  Widget onTap({required void Function() onTap, bool isEnabled = true}) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: MouseRegion(cursor: SystemMouseCursors.click, child: this),
    );
  }
}
