import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get getMonth => DateFormat('MMMM').format(this);
  String get getMonthAndYear => DateFormat('MMMM yyyy').format(this);
}