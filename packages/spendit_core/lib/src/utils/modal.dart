import 'package:flutter/material.dart';
import 'package:spendit_core/src/widgets/bottom_sheet.dart';

Future<T?> openBottomSheet<T>(
  BuildContext context, {
  required Widget Function(BuildContext context) builder,
  bool showCloseIcon = false,
  String? title,
  double? height,
  bool isDismissable = true,
}) => showModalBottomSheet(
  context: context,
  isDismissible: isDismissable,
  builder:
      (context) => DefaultBottomSheet(
        builder: builder,
        showCloseIcon: showCloseIcon,
        height: height,
        title: title,
      ),
);
