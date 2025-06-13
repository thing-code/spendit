import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_core/src/widgets/bottom_sheet.dart';

/// Custom modal bottom sheet with default settings.
Future<T?> openBottomSheet<T>(
  BuildContext context, {
  required Widget Function(BuildContext context) builder,
  bool showCloseIcon = false,
  String? title,
  double? height,
  bool isDismissable = true,
  bool isScrollControlled = true,
}) => showModalBottomSheet(
  context: context,
  isDismissible: isDismissable,
  isScrollControlled: isScrollControlled,
  builder: (context) => DefaultBottomSheet(
    builder: builder,
    showCloseIcon: showCloseIcon,
    height: height,
    title: title,
  ),
);

/// Open a date picker based on custom bottom sheet.
Future<DateTime?> openDatePicker(
  BuildContext context, {
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? initialDate,
}) {
  DateTime? selectedDate;
  return openBottomSheet(
    context,
    // title: 'Pilih Tanggal',
    // showCloseIcon: true,
    height: context.deviceHeight * .6,
    builder: (context) {
      return Column(
        children: [
          CalendarDatePicker(
            initialDate: initialDate ?? DateTime.now(),
            firstDate: firstDate,
            lastDate: lastDate,
            onDateChanged: (value) {
              selectedDate = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SpendItButton.primary(
              text: 'Pilih',
              onPressed: () => Navigator.pop(context, selectedDate),
            ),
          ),
        ],
      );
    },
  );
}
