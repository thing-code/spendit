import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get getMonth => DateFormat('MMMM').format(this);
}