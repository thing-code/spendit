import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get getMonth => DateFormat('MMMM').format(this);
  String get getMonthAndYear => DateFormat('MMMM yyyy').format(this);
  String get getCompact => DateFormat('dd MMM yyyy').format(this);
  String get getCompactTime => DateFormat('d MMM yyyy HH:mm').format(this);
  String get getDate => DateFormat('EEEE, d MMMM yyyy').format(this);
  String get getPeriodAlt => DateFormat('yyyy-MM-01').format(this);
  String get getPeriod => DateFormat('yyyy-MM-dd').format(this);
  bool isSameDate(DateTime other) => year == other.year && month == other.month && day == other.day;
}
