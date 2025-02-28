import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get getMonth => DateFormat('MMMM').format(this);
  String get getMonthAndYear => DateFormat('MMMM yyyy').format(this);
  String get getDate => DateFormat('dd MMM yyyy').format(this);
  String get getPeriod => DateFormat('yyyy-MM-01').format(this);
  String get getCompact => DateFormat('yyyy-MM-dd').format(this);
}
