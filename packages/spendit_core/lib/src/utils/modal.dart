import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_core/src/widgets/bottom_sheet.dart';

/// Custom modal bottom sheet with default settings.
Future<T?> openBottomSheet<T>(
  BuildContext context, {
  required Widget Function(ValueChanged<T> close) builder,
  String? title,
  bool isDismissable = true,
}) => showModalBottomSheet<T>(
  context: context,
  enableDrag: isDismissable,
  backgroundColor: SiColors.background,
  builder: (context) => SiBottomSheet<T>(
    close: (value) => Navigator.pop(context, value),
    builder: builder,
    title: title,
  ),
);
