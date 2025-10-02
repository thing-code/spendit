import 'package:intl/intl.dart';

extension StringExtension on String {
  int get parseThousand => NumberFormat.decimalPattern('id').parse(this).toInt();
}
