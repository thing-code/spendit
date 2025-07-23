import 'package:flutter/cupertino.dart';
import 'package:spendit_core/src/widgets/bottom_sheet.dart';

/// Custom modal bottom sheet with default settings.
Future<T?> openBottomSheet<T>(
  BuildContext context, {
  required Widget Function(ValueChanged<T> close) builder,
  String? title,
  bool isDismissable = true,
}) => showCupertinoSheet<T>(
  context: context,
  enableDrag: isDismissable,
  pageBuilder: (context) => CupertinoBottomSheet<T>(
    close: (value) => Navigator.pop(context, value),
    builder: builder,
    title: title,
  ),
);
